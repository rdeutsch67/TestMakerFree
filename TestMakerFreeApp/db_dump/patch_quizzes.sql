--
-- Name: quizzes_stamp(); Type: FUNCTION; Schema: public; Owner: EkorAdmin
--
create function quizzes_stamp()
  returns trigger
language plpgsql
as $$
BEGIN
  -- update LastModifiedDate
  if (TG_OP = 'INSERT') then
    new."LastModifiedDate" := current_timestamp at time zone 'cet';
  end if;

  if (TG_OP = 'UPDATE') then
    if (new."LastModifiedDate" = old."LastModifiedDate") then
      new."LastModifiedDate" := current_timestamp at time zone 'cet';
    end if;
  end if;

  RETURN NEW;
END;
$$;

alter function quizzes_stamp()
  owner to "EkorAdmin";

--
-- Name: Quizzes quizzes_stamp; Type: TRIGGER; Schema: public; Owner: EkorAdmin
--
CREATE TRIGGER quizzes_stamp BEFORE INSERT OR UPDATE ON public."Quizzes" FOR EACH ROW EXECUTE PROCEDURE public.quizzes_stamp();
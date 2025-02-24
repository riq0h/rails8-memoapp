import { application } from "./application";
import SearchController from "./search_controller";
import MemoCardController from "./memo_card_controller";
import MemoFormController from "./memo_form_controller";

application.register("search", SearchController);
application.register("memo_card", MemoCardController);
application.register("memo_form", MemoFormController);

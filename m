Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFBA805E94
	for <lists+freedreno@lfdr.de>; Tue,  5 Dec 2023 20:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF69710E23E;
	Tue,  5 Dec 2023 19:23:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5710E23E
 for <freedreno@lists.freedesktop.org>; Tue,  5 Dec 2023 19:23:56 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5d3c7ef7b31so54669077b3.3
 for <freedreno@lists.freedesktop.org>; Tue, 05 Dec 2023 11:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701804236; x=1702409036; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BdRBhUdiy88VquPMK67xhYktoxpymuyrZgVHcTfKEvE=;
 b=Qc6S2qI87y6OBfkinsOBXDAPilrUDkukKHCS7eqkx2gciN4V3nVLQ6FogbCBnauVkJ
 i3YYjPsysyZz805XfxxP5jDjh/hhOwrmu6iTNQuvmSeQplZqT6ZfbbJcYDDgZpmRmb2p
 tFQKDNMkZga5w0M6GTuURiQbnzUtJthThmAohsBX9zb7VUByVIBzAyh/s86bo+whmJmf
 Qk0adDhcWljEcMBzw03yscXz2bsPYJI7dTlKx9UnCTswyA9brdlKVpTyxLvIivKFIlx9
 yBSdL3jnQesWl3RGhakSR1d/yohPdXh/aA34+5edF3MhN5hrey1/H1WjGErQ2BAg6uz5
 QMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701804236; x=1702409036;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BdRBhUdiy88VquPMK67xhYktoxpymuyrZgVHcTfKEvE=;
 b=n2y5ZoLlx4g18cOCOiXAw159c23/3imVt9z4kMmIdXolkU5E3lo9j0r8rmpQNZWYIU
 4u5xhIQlUsFEuwqxchl9/PU9BMU51slEYgoBAxPGD/CHwrF9sUMlS7lnmw0oxqIzZUSD
 KNuSJdrQrwSGVdULK1mOSc2zBmD1+ylCXtQfWIrLTJTIASbRH2Oa2c1bqMgcAxmKcwb1
 x9hCyqMMbvMO1T1ZoRh7G/KZVINEaKfUTZTcanpA622EzmQvhcl2xqv0tvl9tpb2x+ro
 wQcWPLUbtyJQdSqgeAH3EbjzcnviZZAdgcPwB+dyICVEUGIkX2o44pbScNcpivEwGG9d
 NWxw==
X-Gm-Message-State: AOJu0YyhA4amwvFMUwe/s2dfeZ3WvRO5NSzs/j2TEIbPjdKq3ReFRGky
 9PhLckPW/I3UGKxqEJwB98WNivHaGQjNBfY4SnaFRbNjIncD6p0a
X-Google-Smtp-Source: AGHT+IGB24KSnxVVlF0WcGTerZgKeR7iu4J2TyHqkH8G5+AR3JONk0fWgkApmnJi7B2J3ElKVEbAH456C7zrG8FOpQk=
X-Received: by 2002:a81:af4c:0:b0:5d7:1941:355f with SMTP id
 x12-20020a81af4c000000b005d71941355fmr4547451ywj.70.1701804235869; Tue, 05
 Dec 2023 11:23:55 -0800 (PST)
MIME-Version: 1.0
References: <1701734134-7816-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprgES1tA1E=17Bnrz8n7mX1COpkx=w-vhWge4ywZ1E0ZQ@mail.gmail.com>
 <e5cc8bb5-f704-73fa-7801-8fc59c7fc4eb@quicinc.com>
In-Reply-To: <e5cc8bb5-f704-73fa-7801-8fc59c7fc4eb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 21:23:44 +0200
Message-ID: <CAA8EJpqHaTx0mCXetLn2cMUJcPPpV-FGTnTs1zLn9MUE0P5StA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: improve DSC allocation
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 5 Dec 2023 at 20:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 12/4/2023 4:23 PM, Dmitry Baryshkov wrote:
> > On Tue, 5 Dec 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> A DCE (Display Compression Engine) contains two DSC hard slice
> >> encoders. Each DCE start with even DSC encoder index followed by
> >> an odd DSC encoder index. Each encoder can work independently.
> >> But Only two DSC encoders from same DCE can be paired to work
> >> together to support merge mode. In addition, the DSC with even
> >> index have to mapping to even pingpong index and DSC with odd
> >> index have to mapping to odd pingpong index at its data path.
> >> This patch improve DSC allocation mechanism with consideration
> >> of above factors.
> >>
> >> Changes in V2:
> >> -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
> >>     _dpu_rm_reserve_dsc_pair()
> > Please don't send the new iteration of the patch if the discussion is ongoing.
> Got it, thanks.
> >
> > Quoting v1 review:
> >
> > Are the limitations (odd:odd, allocation in pairs, etc) applicable to
> > v1.1 encoders?
> >
> > I assume that at least 'allocate two consecutive DSC for DSC merge' is
> > not applicable, since there are no separate DCE units.
>
> yes, you are correct in the hardware point of view.
>
> However, at software, we can think think of dsc index 0 and 1 are bound
> to DCE #1, index 2 and 3 are bound to DCE #2 and etc in regardless of
> v1.1 or v1.2.
>
> By doing that,this dsc allocation algorithm should be able to apply to
> both.
>
> There is no case to have dsc index 1 and dsc index 2 bind together (skip
> dsc index 0) to support merge mode.

Yes. However this might cause issues on the platforms which have DSI,
DP and just two DSC encoders. Consider RM allocating two odd (or two
even) PP blocks. One for DSI, one for DP. Then if we need DSC on both
interfaces, the RM won't be able to allocate it.

>
> >
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 171 ++++++++++++++++++++++++++++++---
> >>   1 file changed, 156 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index 17ecf23..dafe1ee 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -470,33 +470,174 @@ static int _dpu_rm_reserve_ctls(
> >>          return 0;
> >>   }
> >>
> >> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
> >>                                 struct dpu_global_state *global_state,
> >> -                              struct drm_encoder *enc,
> >> +                              uint32_t enc_id,
> >>                                 const struct msm_display_topology *top)
> >>   {
> >> -       int num_dsc = top->num_dsc;
> >> -       int i;
> >> +       int num_dsc = 0;
> >> +       int i, pp_idx;
> >> +       int dsc_idx[DSC_MAX - DSC_0];
> >> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> >> +
> >> +       for (i = 0; i < DSC_MAX - DSC_0; i++)
> >> +               dsc_idx[i] = 0;
> >> +
> >> +       /* fill working copy with pingpong list */
> >> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
> >> +
> >> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= top->num_dsc; i++) {
> >> +               if (!rm->dsc_blks[i])
> >> +                       continue;
> >>
> >> -       /* check if DSC required are allocated or not */
> >> -       for (i = 0; i < num_dsc; i++) {
> >> -               if (!rm->dsc_blks[i]) {
> >> -                       DPU_ERROR("DSC %d does not exist\n", i);
> >> -                       return -EIO;
> >> +               if (global_state->dsc_to_enc_id[i])     /* used */
> >> +                       continue;
> >> +
> >> +               /*
> >> +                * find the pingpong index which had been reserved
> >> +                * previously at layer mixer allocation
> >> +                */
> >> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> >> +                       if (pp_to_enc_id[pp_idx] == enc_id)
> >> +                               break;
> >>                  }
> >>
> >> -               if (global_state->dsc_to_enc_id[i]) {
> >> -                       DPU_ERROR("DSC %d is already allocated\n", i);
> >> -                       return -EIO;
> >> +               /*
> >> +                * dsc even index must map to pingpong even index
> >> +                * dsc odd index must map to pingpong odd index
> >> +                */
> >> +               if ((i & 0x01) != (pp_idx & 0x01))
> >> +                       continue;
> >> +
> >> +               dsc_idx[num_dsc++] = i + 1;     /* found, start from 1 */
> >> +       }
> >> +
> >> +       if (num_dsc < top->num_dsc) {
> >> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> >> +                                               num_dsc, top->num_dsc);
> >> +               return -ENAVAIL;
> >> +       }
> >> +
> >> +       /* reserve dsc */
> >> +       for (i = 0; i < top->num_dsc; i++) {
> >> +               int j;
> >> +
> >> +               j = dsc_idx[i];
> >> +               if (j)
> >> +                       global_state->dsc_to_enc_id[j-1] = enc_id;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
> >> +                              struct dpu_global_state *global_state,
> >> +                              uint32_t enc_id,
> >> +                              const struct msm_display_topology *top)
> >> +{
> >> +       int num_dsc = 0;
> >> +       int i, pp_idx;
> >> +       int dsc_idx[DSC_MAX - DSC_0];
> >> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> >> +
> >> +       for (i = 0; i < DSC_MAX - DSC_0; i++)
> >> +               dsc_idx[i] = 0;
> >> +
> >> +       /* fill working copy with pingpong list */
> >> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
> >> +
> >> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= top->num_dsc; i++) {
> >> +               if (!rm->dsc_blks[i])
> >> +                       continue;
> >> +
> >> +               if (global_state->dsc_to_enc_id[i]) {   /* used */
> >> +                       /* consective dsc index to be paired */
> >> +                       if (num_dsc) {  /* already start pairing, re start search */
> >> +                               num_dsc = 0;
> >> +                               /* fill working copy with pingpong list */
> >> +                               memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
> >> +                                                               sizeof(pp_to_enc_id));
> >> +                       }
> >> +                       continue;
> >> +               }
> >> +
> >> +               /* odd index can not become start of pairing */
> >> +               if (i & 0x01 && !num_dsc)
> >> +                       continue;
> >> +
> >> +               /*
> >> +                * find the pingpong index which had been reserved
> >> +                * previously at layer mixer allocation
> >> +                */
> >> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> >> +                       if (pp_to_enc_id[pp_idx] == enc_id)
> >> +                               break;
> >>                  }
> >> +
> >> +               /*
> >> +                * dsc even index must map to pingpong even index
> >> +                * dsc odd index must map to pingpong odd index
> >> +                */
> >> +               if ((i & 0x01) != (pp_idx & 0x01))
> >> +                       continue;
> >> +
> >> +               /*
> >> +                * delete pp_idx so that next pp_idx can be paired with
> >> +                * next dsc_idx
> >> +                */
> >> +               pp_to_enc_id[pp_idx] = 0xffff;
> >> +
> >> +               dsc_idx[num_dsc++] = i + 1;     /* found, start from 1 */
> >>          }
> >>
> >> -       for (i = 0; i < num_dsc; i++)
> >> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> >> +       if (num_dsc < top->num_dsc) {
> >> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> >> +                                               num_dsc, top->num_dsc);
> >> +               return -ENAVAIL;
> >> +       }
> >> +
> >> +       /* reserve dsc */
> >> +       for (i = 0; i < top->num_dsc; i++) {
> >> +               int j;
> >> +
> >> +               j = dsc_idx[i];
> >> +               if (j)
> >> +                       global_state->dsc_to_enc_id[j-1] = enc_id;
> >> +       }
> >>
> >>          return 0;
> >>   }
> >>
> >> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >> +                              struct dpu_global_state *global_state,
> >> +                              uint32_t enc_id,
> >> +                              const struct msm_display_topology *top)
> >> +{
> >> +       if (!top->num_dsc || !top->num_intf)
> >> +               return 0;
> >> +
> >> +       /*
> >> +        * Truth:
> >> +        * 1) every layer mixer only connects to one pingpong
> >> +        * 2) no pingpong split -- which is two layer mixers shared one pingpong
> >> +        * 3) each DSC engine contains two dsc encoders
> >> +        *    -- index(0,1), index (2,3),... etc
> > Does this apply to v1.1 encoders?
> >
> >> +        * 4) dsc pair can only happens with same DSC engine
> >> +        * 5) odd pingpong connect to odd dsc
> >> +        * 6) even pingpong connect to even dsc
> >> +        * 7) pair: encoder +--> pp_idx_0 --> dsc_idx_0
> >> +                           +--> pp_idx_1 --> dsc_idx_1
> >> +        */
> >> +
> >> +       /* num_dsc should be either 1, 2 or 4 */
> >> +       if (top->num_dsc > top->num_intf)       /* merge mode */
> >> +               return _dpu_rm_reserve_dsc_pair(rm, global_state, enc_id, top);
> >> +       else
> >> +               return _dpu_rm_reserve_dsc_single(rm, global_state, enc_id, top);
> >> +}
> >> +
> >>   static int _dpu_rm_make_reservation(
> >>                  struct dpu_rm *rm,
> >>                  struct dpu_global_state *global_state,
> >> @@ -518,7 +659,7 @@ static int _dpu_rm_make_reservation(
> >>                  return ret;
> >>          }
> >>
> >> -       ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
> >> +       ret  = _dpu_rm_reserve_dsc(rm, global_state, enc->base.id, &reqs->topology);
> >>          if (ret)
> >>                  return ret;
> >>
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry

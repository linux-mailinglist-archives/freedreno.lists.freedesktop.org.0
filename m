Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F2807B22
	for <lists+freedreno@lfdr.de>; Wed,  6 Dec 2023 23:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF36A10E109;
	Wed,  6 Dec 2023 22:08:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BF910E109
 for <freedreno@lists.freedesktop.org>; Wed,  6 Dec 2023 22:08:34 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5d3efc071e2so2704407b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 06 Dec 2023 14:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701900514; x=1702505314; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ryZgOOzwZpBB1jCU1bRmZFIcaYvFMNR35NJsGqWsfQ8=;
 b=bDC3lEvHeYAK3Lsp6Sxe+WMUNcX+NF/MdSRHJ+xTFudVao4xOEAgX5ryQCdComZsFz
 H2zm3/uz6HUT+2S01nHi0OoFyTGpKSsZ7UUrUzNUTBGf87NPMyAGno9bv98t1idE+NFi
 CPWHVKmatZjFmUbKZeWZBSZ8hTfpwZAqbjqLZWDRu9kdgyD4hisikC4yV/7sJuMVLlcj
 NaWqoEMbs8IGZgt7HkLX239bIvflh5rR+fgSIl8nR3iMIb8fAVxL+qomRITtVN1SJHMq
 zrd+N2XsYdkGTdMSfx5nE+1FetWSX+N9RYppiUAK4YABFc2lSfepfrXi52weMAootRqK
 pTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701900514; x=1702505314;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ryZgOOzwZpBB1jCU1bRmZFIcaYvFMNR35NJsGqWsfQ8=;
 b=ri2zlojnxcOT5g1aIHA2za+PEbt3SURGIKb+tXy3VYL/29cAjE4WRBkJ/lmbtePH34
 AB1zKNb1gOCSzFMQ4kT46BrTpfHp0/wauMjqRnLacvofGhfT/2qEzFmYsMYlfl+9+nXk
 1PUi0zqCy1kSgaVo5IDpwMRm9hs1eX99cqvf/WrRM4LBad/rp4ngUUDhgcPQHJ5zkJVg
 l+brPx267wi6ccBcKvCAiS6GIkRaN4AdFS88BxwZRcgOlTW5xwALTKTj0Qs9585eQ1Vd
 Ydp+7XPp9okkX2aNKMwbP3ptA1wei6Z+Tjal9/u05pkGwLvBse7veR6nANgxzJtZFDy2
 /9fA==
X-Gm-Message-State: AOJu0Yz1Jf5vZQIUN1zt4Pkp8PPb/F9TBGArvSQ7XRbb1g4zaHwpjvVV
 S1TLN23CXspnWqaUgCveEldqxXB1Ow0U8GMng3gkUoFAB9F0Kf5l
X-Google-Smtp-Source: AGHT+IG/woMIVrpfsDHsZQDhTL5DVAlcr4R+lwqgy3Np0tYLNP/fJlVBef9yZrqoI5odz7olK9oqYpVlFA8I0ELlKbk=
X-Received: by 2002:a05:690c:360b:b0:5d0:7361:1e53 with SMTP id
 ft11-20020a05690c360b00b005d073611e53mr1652266ywb.25.1701900513736; Wed, 06
 Dec 2023 14:08:33 -0800 (PST)
MIME-Version: 1.0
References: <1701734134-7816-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprgES1tA1E=17Bnrz8n7mX1COpkx=w-vhWge4ywZ1E0ZQ@mail.gmail.com>
 <e5cc8bb5-f704-73fa-7801-8fc59c7fc4eb@quicinc.com>
 <CAA8EJpqHaTx0mCXetLn2cMUJcPPpV-FGTnTs1zLn9MUE0P5StA@mail.gmail.com>
 <488b7e77-cb5f-f0e5-fd4f-12535aa17470@quicinc.com>
 <6e447c1f-f7c5-48c1-9474-5362575b74d8@linaro.org>
 <1b6e7c9f-9df5-2371-49c6-5d45808852cb@quicinc.com>
In-Reply-To: <1b6e7c9f-9df5-2371-49c6-5d45808852cb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 00:08:22 +0200
Message-ID: <CAA8EJpoE1eiwxVvodqe49s_ETVaZ_-ZcsuOeogo76fv9FAuk_Q@mail.gmail.com>
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

On Wed, 6 Dec 2023 at 19:34, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 12/6/2023 1:35 AM, Dmitry Baryshkov wrote:
> > On 05/12/2023 22:51, Kuogee Hsieh wrote:
> >>
> >> On 12/5/2023 11:23 AM, Dmitry Baryshkov wrote:
> >>> On Tue, 5 Dec 2023 at 20:12, Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>> wrote:
> >>>>
> >>>> On 12/4/2023 4:23 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, 5 Dec 2023 at 01:55, Kuogee Hsieh
> >>>>> <quic_khsieh@quicinc.com> wrote:
> >>>>>> A DCE (Display Compression Engine) contains two DSC hard slice
> >>>>>> encoders. Each DCE start with even DSC encoder index followed by
> >>>>>> an odd DSC encoder index. Each encoder can work independently.
> >>>>>> But Only two DSC encoders from same DCE can be paired to work
> >>>>>> together to support merge mode. In addition, the DSC with even
> >>>>>> index have to mapping to even pingpong index and DSC with odd
> >>>>>> index have to mapping to odd pingpong index at its data path.
> >>>>>> This patch improve DSC allocation mechanism with consideration
> >>>>>> of above factors.
> >>>>>>
> >>>>>> Changes in V2:
> >>>>>> -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
> >>>>>>      _dpu_rm_reserve_dsc_pair()
> >>>>> Please don't send the new iteration of the patch if the discussion
> >>>>> is ongoing.
> >>>> Got it, thanks.
> >>>>> Quoting v1 review:
> >>>>>
> >>>>> Are the limitations (odd:odd, allocation in pairs, etc) applicable to
> >>>>> v1.1 encoders?
> >>>>>
> >>>>> I assume that at least 'allocate two consecutive DSC for DSC
> >>>>> merge' is
> >>>>> not applicable, since there are no separate DCE units.
> >>>> yes, you are correct in the hardware point of view.
> >>>>
> >>>> However, at software, we can think think of dsc index 0 and 1 are
> >>>> bound
> >>>> to DCE #1, index 2 and 3 are bound to DCE #2 and etc in regardless of
> >>>> v1.1 or v1.2.
> >>>>
> >>>> By doing that,this dsc allocation algorithm should be able to apply to
> >>>> both.
> >>>>
> >>>> There is no case to have dsc index 1 and dsc index 2 bind together
> >>>> (skip
> >>>> dsc index 0) to support merge mode.
> >>> Yes. However this might cause issues on the platforms which have DSI,
> >>> DP and just two DSC encoders. Consider RM allocating two odd (or two
> >>> even) PP blocks. One for DSI, one for DP. Then if we need DSC on both
> >>> interfaces, the RM won't be able to allocate it.
> >>
> >>
> >> I am not sure this case is possible.
> >>
> >> DSC + pingpong  allocation is base on Layer mixer which is allocated
> >> sequentially.
> >
> > Not sequentially, but also in pairs. Yes, LM_5 (a pair for LM_2 on
> > sdm845) is connected to PINGPONG_3. However all this doesn't make
> > things easier to understand or to snoop bugs. I'd prefer to keep a
> > simple allocation code for older DSC blocks. Especially since I might
> > have to touch LM allocation for MDP 1.x platforms.
>
> 1) from dpu_rm_reserve() --> _dpu_rm_make_reservation() -->
> _dpu_rm_reserve_dsc() path, there is no any flag can be used to identify
> is this allocation is for dsc V1.1 or V1.2

We know which DSC encoder is going to be used since the point when we
setup the RM.

>
> 2) your earlier question -- Are the limitations (odd:odd, allocation in
> pairs, etc) applicable to v1.1 encoders? <== the answer is true, my
> apology to have not confirmed this earlier.
>
> I try to said is the checking pp-index and dsc-index (odd:odd,
> even:even) at new implementation is to correct original (v1.1) mistake.

Ok. Then it should come as a separate commit with the proper Fixed tag.

>
> >
> >> ex, first lm --> pingpong --> dsc allocate completed then followed by
> >> next lm --> pingpong --> dsc allocation.
> >>
> >> therefore it is not possible to have case with two odd pingpong index
> >> to map two odd dsc index.
> >>
> >> With this algorithm, there is one case (below) which can not be
> >> supported is,
> >>
> >> dsc_0 for pingpong-0 of stand alone mode + dsc-1 and dsc-2 for
> >> pingpong-1 and ping pong-2 to support merge mode for DSC v1.1.
> >>
> >> However  there is no hardware configuration which only have 3 or 5
> >> dsc encoders due to dsc always come in pair except some low end chip
> >> which mdp come with only one dsc encoder.
> >>
> >>
> >>
> >>
> >>>
> >>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>>>> ---
> >>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 171
> >>>>>> ++++++++++++++++++++++++++++++---
> >>>>>>    1 file changed, 156 insertions(+), 15 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>>>>> index 17ecf23..dafe1ee 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>>>>> @@ -470,33 +470,174 @@ static int _dpu_rm_reserve_ctls(
> >>>>>>           return 0;
> >>>>>>    }
> >>>>>>
> >>>>>> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >>>>>> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
> >>>>>>                                  struct dpu_global_state
> >>>>>> *global_state,
> >>>>>> -                              struct drm_encoder *enc,
> >>>>>> +                              uint32_t enc_id,
> >>>>>>                                  const struct
> >>>>>> msm_display_topology *top)
> >>>>>>    {
> >>>>>> -       int num_dsc = top->num_dsc;
> >>>>>> -       int i;
> >>>>>> +       int num_dsc = 0;
> >>>>>> +       int i, pp_idx;
> >>>>>> +       int dsc_idx[DSC_MAX - DSC_0];
> >>>>>> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >
> > You don't need pp_to_enc_id copy in the _single usecase. Just use the
> > exisiting rm data.
> >
> >>>>>> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> >
> > inline
> >
> >>>>>> +
> >>>>>> +       for (i = 0; i < DSC_MAX - DSC_0; i++)
> >>>>>> +               dsc_idx[i] = 0;
> >
> > You know, this is called memset.
> >
> >>>>>> +
> >>>>>> +       /* fill working copy with pingpong list */
> >>>>>> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
> >>>>>> sizeof(pp_to_enc_id));
> >>>>>> +
> >>>>>> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >=
> >>>>>> top->num_dsc; i++) {
> >>>>>> +               if (!rm->dsc_blks[i])
> >>>>>> +                       continue;
> >>>>>>
> >>>>>> -       /* check if DSC required are allocated or not */
> >>>>>> -       for (i = 0; i < num_dsc; i++) {
> >>>>>> -               if (!rm->dsc_blks[i]) {
> >>>>>> -                       DPU_ERROR("DSC %d does not exist\n", i);
> >>>>>> -                       return -EIO;
> >>>>>> +               if (global_state->dsc_to_enc_id[i])     /* used */
> >>>>>> +                       continue;
> >>>>>> +
> >>>>>> +               /*
> >>>>>> +                * find the pingpong index which had been reserved
> >>>>>> +                * previously at layer mixer allocation
> >>>>>> +                */
> >>>>>> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> >>>>>> +                       if (pp_to_enc_id[pp_idx] == enc_id)
> >
> > !reserved_by_other()
> >
> >>>>>> + break;
> >>>>>>                   }
> >>>>>>
> >>>>>> -               if (global_state->dsc_to_enc_id[i]) {
> >>>>>> -                       DPU_ERROR("DSC %d is already
> >>>>>> allocated\n", i);
> >>>>>> -                       return -EIO;
> >>>>>> +               /*
> >>>>>> +                * dsc even index must map to pingpong even index
> >>>>>> +                * dsc odd index must map to pingpong odd index
> >>>>>> +                */
> >>>>>> +               if ((i & 0x01) != (pp_idx & 0x01))
> >>>>>> +                       continue;
> >>>>>> +
> >>>>>> +               dsc_idx[num_dsc++] = i + 1;     /* found, start
> >>>>>> from 1 */
> >
> > It's not +1. It is DSC_0 + i.
> >
> >>>>>> +       }
> >>>>>> +
> >>>>>> +       if (num_dsc < top->num_dsc) {
> >>>>>> +               DPU_ERROR("DSC allocation failed num_dsc=%d
> >>>>>> required=%d\n",
> >>>>>> +                                               num_dsc,
> >>>>>> top->num_dsc);
> >>>>>> +               return -ENAVAIL;
> >>>>>> +       }
> >>>>>> +
> >>>>>> +       /* reserve dsc */
> >>>>>> +       for (i = 0; i < top->num_dsc; i++) {
> >>>>>> +               int j;
> >>>>>> +
> >>>>>> +               j = dsc_idx[i];
> >>>>>> +               if (j)
> >>>>>> + global_state->dsc_to_enc_id[j-1] = enc_id;
> >>>>>> +       }
> >>>>>> +
> >>>>>> +       return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
> >>>>>> +                              struct dpu_global_state
> >>>>>> *global_state,
> >>>>>> +                              uint32_t enc_id,
> >>>>>> +                              const struct msm_display_topology
> >>>>>> *top)
> >
> >
> >>>>>> +{
> >>>>>> +       int num_dsc = 0;
> >>>>>> +       int i, pp_idx;
> >>>>>> +       int dsc_idx[DSC_MAX - DSC_0];
> >>>>>> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >>>>>> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> >>>>>> +
> >>>>>> +       for (i = 0; i < DSC_MAX - DSC_0; i++)
> >>>>>> +               dsc_idx[i] = 0;
> >>>>>> +
> >>>>>> +       /* fill working copy with pingpong list */
> >>>>>> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
> >>>>>> sizeof(pp_to_enc_id));
> >>>>>> +
> >>>>>> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >=
> >>>>>> top->num_dsc; i++) {
> >
> > Much easier. Just do i+= 2 here and in the loop check that the second
> > half of DCE is not used.
> >
> >>>>>> +               if (!rm->dsc_blks[i])
> >>>>>> +                       continue;
> >>>>>> +
> >>>>>> +               if (global_state->dsc_to_enc_id[i]) {   /* used */
> >>>>>> +                       /* consective dsc index to be paired */
> >>>>>> +                       if (num_dsc) {  /* already start pairing,
> >>>>>> re start search */
> >>>>>> +                               num_dsc = 0;
> >>>>>> +                               /* fill working copy with
> >>>>>> pingpong list */
> >>>>>> +                               memcpy(pp_to_enc_id,
> >>>>>> global_state->pingpong_to_enc_id,
> >>>>>> + sizeof(pp_to_enc_id));
> >>>>>> +                       }
> >>>>>> +                       continue;
> >>>>>> +               }
> >>>>>> +
> >>>>>> +               /* odd index can not become start of pairing */
> >>>>>> +               if (i & 0x01 && !num_dsc)
> >>>>>> +                       continue;
> >>>>>> +
> >>>>>> +               /*
> >>>>>> +                * find the pingpong index which had been reserved
> >>>>>> +                * previously at layer mixer allocation
> >>>>>> +                */
> >>>>>> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> >>>>>> +                       if (pp_to_enc_id[pp_idx] == enc_id)
> >>>>>> +                               break;
> >>>>>>                   }
> >>>>>> +
> >>>>>> +               /*
> >>>>>> +                * dsc even index must map to pingpong even index
> >>>>>> +                * dsc odd index must map to pingpong odd index
> >>>>>> +                */
> >>>>>> +               if ((i & 0x01) != (pp_idx & 0x01))
> >>>>>> +                       continue;
> >>>>>> +
> >>>>>> +               /*
> >>>>>> +                * delete pp_idx so that next pp_idx can be
> >>>>>> paired with
> >>>>>> +                * next dsc_idx
> >>>>>> +                */
> >>>>>> +               pp_to_enc_id[pp_idx] = 0xffff;
> >>>>>> +
> >>>>>> +               dsc_idx[num_dsc++] = i + 1;     /* found, start
> >>>>>> from 1 */
> >>>>>>           }
> >>>>>>
> >>>>>> -       for (i = 0; i < num_dsc; i++)
> >>>>>> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> >>>>>> +       if (num_dsc < top->num_dsc) {
> >>>>>> +               DPU_ERROR("DSC allocation failed num_dsc=%d
> >>>>>> required=%d\n",
> >>>>>> +                                               num_dsc,
> >>>>>> top->num_dsc);
> >>>>>> +               return -ENAVAIL;
> >>>>>> +       }
> >>>>>> +
> >>>>>> +       /* reserve dsc */
> >>>>>> +       for (i = 0; i < top->num_dsc; i++) {
> >>>>>> +               int j;
> >>>>>> +
> >>>>>> +               j = dsc_idx[i];
> >>>>>> +               if (j)
> >>>>>> + global_state->dsc_to_enc_id[j-1] = enc_id;
> >>>>>> +       }
> >>>>>>
> >>>>>>           return 0;
> >>>>>>    }
> >>>>>>
> >>>>>> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >>>>>> +                              struct dpu_global_state
> >>>>>> *global_state,
> >>>>>> +                              uint32_t enc_id,
> >>>>>> +                              const struct msm_display_topology
> >>>>>> *top)
> >>>>>> +{
> >>>>>> +       if (!top->num_dsc || !top->num_intf)
> >>>>>> +               return 0;
> >>>>>> +
> >>>>>> +       /*
> >>>>>> +        * Truth:
> >>>>>> +        * 1) every layer mixer only connects to one pingpong
> >>>>>> +        * 2) no pingpong split -- which is two layer mixers
> >>>>>> shared one pingpong
> >>>>>> +        * 3) each DSC engine contains two dsc encoders
> >>>>>> +        *    -- index(0,1), index (2,3),... etc
> >>>>> Does this apply to v1.1 encoders?
> >>>>>
> >>>>>> +        * 4) dsc pair can only happens with same DSC engine
> >>>>>> +        * 5) odd pingpong connect to odd dsc
> >>>>>> +        * 6) even pingpong connect to even dsc
> >>>>>> +        * 7) pair: encoder +--> pp_idx_0 --> dsc_idx_0
> >>>>>> +                           +--> pp_idx_1 --> dsc_idx_1
> >>>>>> +        */
> >>>>>> +
> >>>>>> +       /* num_dsc should be either 1, 2 or 4 */
> >>>>>> +       if (top->num_dsc > top->num_intf) /* merge mode */
> >>>>>> +               return _dpu_rm_reserve_dsc_pair(rm, global_state,
> >>>>>> enc_id, top);
> >>>>>> +       else
> >>>>>> +               return _dpu_rm_reserve_dsc_single(rm,
> >>>>>> global_state, enc_id, top);
> >
> > Can we end up with num_dsc = 2, num_intf = 2 and
> > _dpu_rm_reserve_dsc_single() allocating two DSC blocks despite its name?
> >
> >>>>>> +}
> >>>>>> +
> >>>>>>    static int _dpu_rm_make_reservation(
> >>>>>>                   struct dpu_rm *rm,
> >>>>>>                   struct dpu_global_state *global_state,
> >>>>>> @@ -518,7 +659,7 @@ static int _dpu_rm_make_reservation(
> >>>>>>                   return ret;
> >>>>>>           }
> >>>>>>
> >>>>>> -       ret  = _dpu_rm_reserve_dsc(rm, global_state, enc,
> >>>>>> &reqs->topology);
> >>>>>> +       ret  = _dpu_rm_reserve_dsc(rm, global_state,
> >>>>>> enc->base.id, &reqs->topology);
> >
> > Is there any reason to change this?
> >
> >>>>>>           if (ret)
> >>>>>>                   return ret;
> >>>>>>
> >>>>>> --
> >>>>>> 2.7.4
> >>>>>>
> >>>
> >>>
> >



-- 
With best wishes
Dmitry

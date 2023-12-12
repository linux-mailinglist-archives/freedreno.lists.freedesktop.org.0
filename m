Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929B80F9A9
	for <lists+freedreno@lfdr.de>; Tue, 12 Dec 2023 22:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5E410E0AB;
	Tue, 12 Dec 2023 21:46:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBE310E0AB
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 21:46:24 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-dbcae1e53bcso2040206276.3
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 13:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702417583; x=1703022383; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MOR15WBmxTAinH8ck/OdD3xwX+hKPE73IZrMGxPAQuE=;
 b=f81ASlcbtBACES8C4nxWAsoXL4PAGvPBGqr+r+qeCLlrMklEbSmRERB00u6ZlzqgFA
 Jyz1kyrlaT/CH+LHKopS3VDVM24oq6N6Xt6mlAzeEfM+zyPmJsiuT7a882lAo+Vklqqk
 yg1z/YT5QFuQFspfNuaMVJC6KlDp5a/go7AmfdXeT6ydrswyKWWjVIXVjpwssdbzRPOJ
 7WlUhIjM8pYWtxj6iVRSDZadGCaY2yO2N92HmVFoS6kCljbQ3F/qUamM+a2orB06KgsU
 UPJaTm1IUV47TML6Oc4CFtURYKs4UpVF3my0KQ2XvL2J07vpKRTfI6NR5L/ZMb3mInjY
 RuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702417583; x=1703022383;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MOR15WBmxTAinH8ck/OdD3xwX+hKPE73IZrMGxPAQuE=;
 b=U6i5AKxONwgzD7aHCWAVrPDkslFb3KpkZS2eYsLqqpTwTey6lWTHMNTNMNxBz5DJYX
 ppXLHph8Z3/otg+OOxWgEhJk4yAVPEjIJ7iVdZGJRYMZf/FyBk2CJYAahZ1JxTR8pAjn
 uOfCNV4dwsgBy7rn9Spw3oqW7fS5Yv4t22nkISy6wl6Nw8pUhqUigN/1Vv5sPDdvDIr0
 +Uegv7WrxUMI5+rFBmLIbaMal3LQGoHVOa0wavmuLdrA730W6RITnddhyx1FRjkqtYIv
 OncGkxdDqZbSAaIP6RITpNozZ+wmsC6/r+K9FNM1MeXLc6EnCgLdm10Qb8xsAHUqWKkj
 SbVQ==
X-Gm-Message-State: AOJu0YwU3KcHJV/CLeSU/kR0KXuAGodTS+7F4yr7f3soJJ4IM+qiz6zs
 kDE/j+CaxfKdeZf/aAipE12XOZLAQpSUynvu50EE/qHAw5fORt4N4m8=
X-Google-Smtp-Source: AGHT+IGwfwYk9JP1KoWMPJa1IehKqtBb8Lu09dj0fOdsLTf4HceD6QiflFUTm7tzalvcwpk61/kH5PxmOvCywg2ks60=
X-Received: by 2002:a25:3411:0:b0:db7:dacf:59e2 with SMTP id
 b17-20020a253411000000b00db7dacf59e2mr4919400yba.86.1702417583349; Tue, 12
 Dec 2023 13:46:23 -0800 (PST)
MIME-Version: 1.0
References: <1702319923-24518-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqAch3Qhq_nfecA06d9fk1jUMD1Dx0ZgNGrom6BrwFo5A@mail.gmail.com>
 <baf2ebe7-7895-9249-8487-a7c7e61a67c6@quicinc.com>
 <694149b1-e5cd-ad94-0054-76d5bc084e4f@quicinc.com>
In-Reply-To: <694149b1-e5cd-ad94-0054-76d5bc084e4f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 23:46:12 +0200
Message-ID: <CAA8EJpqaPnLofwW+hrqmAA6CF+LdkcX7nre5T4+0cH5Pfdd4tA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu: improve DSC allocation
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 12 Dec 2023 at 23:26, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 12/11/2023 4:03 PM, Kuogee Hsieh wrote:
> >
> > On 12/11/2023 1:30 PM, Dmitry Baryshkov wrote:
> >> On Mon, 11 Dec 2023 at 20:38, Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> wrote:
> >>> A DCE (Display Compression Engine) contains two DSC hard slice
> >>> encoders. Each DCE start with even DSC encoder index followed by
> >> "starts". But it will not be correct. The DCE doesn't start with the
> >> DSC encoder. DCE consists of two DSC encoders, one has an odd index
> >> and another one has an even index.
> >>
> >>> an odd DSC encoder index. Each encoder can work independently.
> >>> But Only two DSC encoders from same DCE can be paired to work
> >> only
> >>
> >>> together to support merge mode. In addition, the DSC with even
> >> There are different merge modes. Here you are talking about the DSC
> >> merge mode.
> >>
> >>> index have to mapping to even pingpong index and DSC with odd
> >> PINGPONG (end everywhere else).
> >>
> >> have to be mapped, should be used, etc.
> >>
> >>> index have to mapping to odd pingpong index at its data path.
> >>> This patch improve DSC allocation mechanism with consideration
> >> improves
> >>
> >>> of above factors.
> >> of these factors.
> >>
> >>> Changes in V3:
> >>> -- add dpu_rm_pingpong_dsc_check()
> >>> -- for pair allocation use i += 2 at for loop
> >>>
> >>> Changes in V2:
> >>>      -- split _dpu_rm_reserve_dsc() into
> >>> _dpu_rm_reserve_dsc_single() and
> >>>         _dpu_rm_reserve_dsc_pair()
> >>>
> >>> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> >> This tag is incorrect. The patch should be split into two pieces. One
> >> which fixes DSC allocation for DSC 1.1 encoders, where there were no
> >> DCE blocks, another one which adds proper handling for DCE.
> >> Unless the paired allocation requirement also applies to pre-DCE DSC
> >> encoders. But in that case the commit message doesn't make any sense.
> >>
> >> I checked 4.x Qualcomm kernels. None of them contained any of these
> >> restrictions for DSC blocks. Only the displaypack targeting 4.19
> >> kernel got these changes. But it predates DCE pairs support.
> >
> > as I said earlier the rule of odd/even pp-index map to odd/even
> > dsc-index is there since dsc v1.1.
> >
> > I think current code (including down stream code) works by luck to not
> > encounter a configuration with two independence paths, one with single
> > dsc and the other one use two dsc to support dsc merge mode.
> >
> > this patch is the fix to enforce this rule for both dsc v1.1 and v1.2
> > and I will rework commit message yo have better description.
> >
> >
> >>
> >>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 171
> >>> ++++++++++++++++++++++++++++++---
> >>>   1 file changed, 155 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> index 17ecf23..43598ee 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> @@ -470,33 +470,172 @@ static int _dpu_rm_reserve_ctls(
> >>>          return 0;
> >>>   }
> >>>
> >>> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >>> +static int _dpu_rm_pingpong_dsc_check(int dsc_idx,
> >>> +                                     uint32_t enc_id,
> >>> +                                     uint32_t *pp_to_enc_id,
> >>> +                                     int pp_max,
> >>> +                                     bool pair)
> >>> +{
> >>> +       int pp_idx;
> >>> +
> >>> +       /*
> >>> +        * find the pingpong index which had been reserved
> >>> +        * previously at layer mixer allocation
> >> during
> >>
> >>> +        */
> >>> +       for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> >>> +               if (pp_to_enc_id[pp_idx] == enc_id)
> >>> +                       break;
> >>> +       }
> >>> +
> >>> +       /*
> >>> +        * dsc even index must map to pingpong even index
> >> DSC with even index.
> >> be mapped or correspond
> >>
> >>
> >>> +        * dsc odd index must map to pingpong odd index
> >>> +        */
> >>> +       if ((dsc_idx & 0x01) != (pp_idx & 0x01))
> >>> +               return -ENAVAIL;
> >>> +
> >>> +       if (pair) {
> >>> +               /*
> >>> +                * delete pp_idx so that same pp_id can not be
> >>> paired with
> >>> +                * next dsc_id
> >>> +                */
> >>> +               pp_to_enc_id[pp_idx] = 0xffff;
> >>> +       }
> >> Ugh. "Non tangere circulos meos". Move this deletion away from this
> >> function.
> >>
> >>> +
> >>> +       return 0;
> >>> +
> >>> +}
> >>> +
> >>> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
> >>>                                 struct dpu_global_state *global_state,
> >>> -                              struct drm_encoder *enc,
> >>> +                              uint32_t enc_id,
> >>>                                 const struct msm_display_topology *top)
> >>>   {
> >>> -       int num_dsc = top->num_dsc;
> >>> -       int i;
> >>> +       int num_dsc = 0;
> >>> +       int i, ret;
> >>> +       int dsc_id[DSC_MAX - DSC_0];
> >>> +       uint32_t *pp_enc_id = global_state->pingpong_to_enc_id;
> >>> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> >>>
> >>> -       /* check if DSC required are allocated or not */
> >>> -       for (i = 0; i < num_dsc; i++) {
> >>> -               if (!rm->dsc_blks[i]) {
> >>> -                       DPU_ERROR("DSC %d does not exist\n", i);
> >>> -                       return -EIO;
> >>> -               }
> >>> +       memset(dsc_id, 0, sizeof(dsc_id));
> >>>
> >>> -               if (global_state->dsc_to_enc_id[i]) {
> >>> -                       DPU_ERROR("DSC %d is already allocated\n", i);
> >>> -                       return -EIO;
> >>> -               }
> >>> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >=
> >>> top->num_dsc; i++) {
> >> Wait. num_dsc >= top->num_dsc? num_dsc starts with 0, so this loop
> >> will never be executed?
> >>
> >>> +               if (!rm->dsc_blks[i])
> >>> +                       continue;
> >>> +
> >>> +               if (global_state->dsc_to_enc_id[i])     /* used */
> >> No. Use reserved_by_other instead of inventing your own conditions.
> >>
> >>> +                       continue;
> >>> +
> >>> +               ret = _dpu_rm_pingpong_dsc_check(i, enc_id,
> >>> pp_enc_id, pp_max, false);
> >>> +               if (!ret)
> >>> +                       dsc_id[num_dsc++] = DSC_0 + i;  /* found,
> >>> start from DSC_0 */
> >> The comment is incorrect. Why do we start from DSC_0? Or what starts
> >> from DSC_0?
>
> since dsc_id[] is initialized with 0, start from DSC_0 is try to help us
> to know dsc_id[] contains valid data  during commit to
> global_state->dsc_to_end_id[] later

It is not 'start from DSC_0'. It is 'convert to DSC index' or
something like that. Start is not a correct verb here.

>
> >>
> >>>          }
> >>>
> >>> -       for (i = 0; i < num_dsc; i++)
> >>> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> >>> +       if (num_dsc < top->num_dsc) {
> >>> +               DPU_ERROR("DSC allocation failed num_dsc=%d
> >>> required=%d\n",
> >>> +                                               num_dsc, top->num_dsc);
> >>> +               return -ENAVAIL;
> >>> +       }
> >>> +
> >>> +       /* allocate dsc */
> >>> +       for (i = 0; i < top->num_dsc; i++) {
> >>> +               int id;
> >>> +
> >>> +               id = dsc_id[i];
> >>> +               if (id >= DSC_0)
> >>> +                       global_state->dsc_to_enc_id[id - DSC_0] =
> >>> enc_id;
> >> Can we fill dsc_to_enc_id directly, without interim arrays?
> no, we have to make all conditions checking passed before commit to
> global_state->dsc_to_end_id[]

No. If the check fails, the whole global_state is destroyed. So it is
safe to commit temporary assignments there.

> >>
> >>> +       }
> >>>
> >>>          return 0;
> >>>   }
> >>>
> >>> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
> >>> +                              struct dpu_global_state *global_state,
> >>> +                              uint32_t enc_id,
> >>> +                              const struct msm_display_topology *top)
> >>> +{
> >>> +       int num_dsc = 0;
> >>> +       int i, ret;
> >>> +       int dsc_id[DSC_MAX - DSC_0];
> >>> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >>> +       uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
> >>> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> >>> +
> >>> +       memset(dsc_id, 0, sizeof(dsc_id));
> >>> +
> >>> +       /* only start from even dsc index */
> >>> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >=
> >>> top->num_dsc; i += 2) {
> >>> +               if (!rm->dsc_blks[i] || !rm->dsc_blks[i + 1])
> >>> +                       continue;
> >>> +
> >>> +               /* consective dsc index to be paired */
> >> consecutive
> >>
> >>> +               if (dsc_enc_id[i] || dsc_enc_id[i + 1]) /* used */
> >>> +                       continue;
> >> reserved_by_other
> >>
> >>> +
> >>> +               /* fill working copy with pingpong list */
> >>> +               memcpy(pp_to_enc_id,
> >>> global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
> >>> +
> >>> +               ret = _dpu_rm_pingpong_dsc_check(i, enc_id,
> >>> pp_to_enc_id, pp_max, true);
> >>> +               if (ret)
> >>> +                       continue;
> >>> +
> >>> +               ret = _dpu_rm_pingpong_dsc_check(i + 1, enc_id,
> >>> pp_to_enc_id, pp_max, true);
> >> In the comment several lines below you wrote that num_dsc can be '4'.
> >> In such case the loop will be executed at least twice. And during the
> >> second iteration of the loop we are going to get the same PP indices
> >> as we got during the first one, even though we should have got third
> >> and fourth PP indices.
> >>
> >>> +               if (ret)
> >>> +                       continue;
> >>> +
> >>> +               /* pair found, start from DSC_0 */
> >> The comment is incorrect.
> >>
> >>> +               dsc_id[num_dsc++] = DSC_0 + i;
> >>> +               dsc_id[num_dsc++] = DSC_0 + i + 1;
> >>> +       }
> >>> +
> >>> +       if (num_dsc < top->num_dsc) {
> >>> +               DPU_ERROR("DSC allocation failed num_dsc=%d
> >>> required=%d\n",
> >>> +                                               num_dsc, top->num_dsc);
> >>> +               return -ENAVAIL;
> >>> +       }
> >>> +
> >>> +       /* allocate dsc */
> >>> +       for (i = 0; i < top->num_dsc; i++) {
> >>> +               int id;
> >>> +
> >>> +               id = dsc_id[i];
> >>> +               if (id >= DSC_0)
> >>> +                       global_state->dsc_to_enc_id[id - DSC_0] =
> >>> enc_id;
> >>> +       }
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >>> +                              struct dpu_global_state *global_state,
> >>> +                              struct drm_encoder *enc,
> >>> +                              const struct msm_display_topology *top)
> >>> +{
> >>> +       uint32_t enc_id = enc->base.id;
> >>> +
> >>> +       if (!top->num_dsc || !top->num_intf)
> >>> +               return 0;
> >>> +
> >>> +       /*
> >>> +        * Truth:
> >>> +        * 1) every layer mixer only connects to one pingpong
> >>> +        * 2) no pingpong split -- which is two layer mixers shared
> >>> one pingpong
> >>> +        * 3) each DSC engine contains two dsc encoders
> >>> +        *    -- index(0,1), index (2,3),... etc
> >>> +        * 4) dsc pair can only happens with same DSC engine
> >>> +        * 5) odd pingpong connect to odd dsc
> >>> +        * 6) even pingpong connect to even dsc
> >>> +        * 7) pair: encoder +--> pp_idx_0 --> dsc_idx_0
> >>> +                           +--> pp_idx_1 --> dsc_idx_1
> >>> +        */
> >>> +
> >>> +       /* num_dsc should be either 1, 2 or 4 */
> >>> +       if (top->num_dsc > top->num_intf)       /* merge mode */
> >>> +               return _dpu_rm_reserve_dsc_pair(rm, global_state,
> >>> enc_id, top);
> >>> +       else
> >>> +               return _dpu_rm_reserve_dsc_single(rm, global_state,
> >>> enc_id, top);
> >> So, can we get num_dsc = 2 and still use _dpu_rm_reserve_dsc_single()?
> yes,

Then why is it called _single then?

> >>
> >>> +}
> >>> +
> >>>   static int _dpu_rm_make_reservation(
> >>>                  struct dpu_rm *rm,
> >>>                  struct dpu_global_state *global_state,
> >>> --
> >>> 2.7.4
> >>>
> >>



-- 
With best wishes
Dmitry

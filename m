Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E24153C5A3
	for <lists+freedreno@lfdr.de>; Fri,  3 Jun 2022 09:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDAD113D7F;
	Fri,  3 Jun 2022 07:02:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C9F113D7E
 for <freedreno@lists.freedesktop.org>; Fri,  3 Jun 2022 07:02:37 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id p8so4967091qtx.9
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jun 2022 00:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bpTxhe8d1wfl9cxmRQmaPd/25jnJpClicp4FOUimKUo=;
 b=d50+tzVxqEhaFcPBBGejf2UJbunWjF5Abb00attFnWFaI9oPYW5zWBgJKvXsSpCdKr
 yDamXzaOpr3WL1MkwYlxNubMOr7It+wygCcPJeO0zaOIocMJq8WI7DEQfvTptzNRHoFW
 pLzInGxQ0yH3fV+FooefbDug8iJCNNLTKatYYsaXIiZuI5JVBgm5hwu/6hQ7dxvvfSNH
 0YSiAJS2kGeiHX8h/By+khNvN1NPsLUq3T+cTimx76r60JxFPn9PqTXBVF0c7HoDSP9D
 oM3nu4PnB+G98qyYwP6fz6PwwbpipeF4YuGDkCvSwf1sql+zht7Nk692c1ytM1bnUkNE
 goQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpTxhe8d1wfl9cxmRQmaPd/25jnJpClicp4FOUimKUo=;
 b=i0mJaHgijK260jMJdKj0+EbnKnhL16b1o3aO5ktkWkytr/li/G4zqi8tHdLWB5Vbk5
 KWeSQc6BnowIzyneKq8LSH/8GqiCtMCI3dSfqLdCEgGwwqmb3gYU83/j6jbumhyzFEvD
 uX3mTtzXAJKKbcu2suZ4YISxCage6XsID/eMK2dE2U0GOExZcv60S++yxPHGI42W/2TG
 dFwsq7moK3tD+ElqTycURCBzHmDDTMsbyQcgxNvUxmqDrYPH8bmtgJymAET3KWAmZCOO
 Q9cmYP4GB4ismEtEZRkXWbw8dUPwCeCc/AYlw4Yl4erkqHNPc2FKva1qtENoTBnuzRsg
 5zNQ==
X-Gm-Message-State: AOAM5314cyR5Cao+i7dq6wTN2HNB6wzkwtykSadvXjFxjaRITWwVomJQ
 nAu62wNrm4YC0wDLzTLFQ2Ry/ngpzEzvjZ56uTkmwA==
X-Google-Smtp-Source: ABdhPJx1Tn+p+ALdFrzKUULQPAzAC+KVROpMIwSkRoSORmiBsKP2vXzREITjvn4vZsl/fX/dydtl1JPNPXChp239G80=
X-Received: by 2002:ac8:5990:0:b0:304:c8d6:3147 with SMTP id
 e16-20020ac85990000000b00304c8d63147mr6502086qte.370.1654239756957; Fri, 03
 Jun 2022 00:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-4-quic_jesszhan@quicinc.com>
 <266fdac1-db57-a729-3d73-42d2b34017cd@linaro.org>
 <aa4617f6-65fd-73c6-61b1-686a72c515d7@quicinc.com>
 <beaaeb57-c144-a680-eea6-20a950d25205@linaro.org>
 <bd96aaaf-e324-295c-a35b-1474deeb706c@quicinc.com>
In-Reply-To: <bd96aaaf-e324-295c-a35b-1474deeb706c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 3 Jun 2022 10:02:26 +0300
Message-ID: <CAA8EJppE8dZFQD0fsoS1YwKTzj6U_CfL1SD6RB5stRnD-7UYuQ@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: Add interface support for
 CRC debugfs
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 3 Jun 2022 at 04:02, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> On 6/2/2022 3:51 PM, Dmitry Baryshkov wrote:
> > On 28/05/2022 01:23, Jessica Zhang wrote:
> >> On 5/27/2022 12:46 PM, Dmitry Baryshkov wrote:
> >>> On 27/05/2022 21:54, Jessica Zhang wrote:
> >>>> Add support for writing CRC values for the interface block to
> >>>> the debugfs by calling the necessary MISR setup/collect methods.
> >>>>
> >>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

[skipped]

> >>>> +
> >>>> +        phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
> >>>> +    }
> >>>> +}
> >>>> +
> >>>> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc)
> >>>> +{
> >>>> +    struct dpu_encoder_virt *dpu_enc;
> >>>> +    u32 crcs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
> >>>> +
> >>>> +    int i, rc;
> >>>> +
> >>>> +    if (!drm_enc->crtc) {
> >>>> +        DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
> >>>> +        return -EINVAL;
> >>>> +    }
> >>>> +
> >>>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
> >>>> +
> >>>> +    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >>>> +        struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> >>>> +
> >>>> +        if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
> >>>> +            continue;
> >>>> +
> >>>> +        rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[i]);
> >>>
> >>> This doesn't look fully correct. Do we need to skip the indices for
> >>> the phys without a backing hw_intf?
> >>
> >> Sorry if I'm misunderstanding your question, but don't we need to have
> >> a backing hw_intf (and skip if there isn't any) since the methods for
> >> collecting/setting MISR registers is within the hw_intf?
> >
> > Yes. So the question if we should skip the phys and leave the crcs[i]
> > untouched, skip the phys and sset crcs[i] to 0 or change
> > dpu_crtc_parse_crc_source() to return the number of intf-backed
> > phys_enc's and do not skip any crcs[i].
>
> Thanks for the clarification.
>
> Is it possible to hit a case where a phys_encoder won't have a
> corresponding hw_intf?
>
> AFAIK, it seems guaranteed that a phys_encoder will have an hw_intf
> since dpu_encoder_setup_display will skip incrementing num_phys_encs if
> dpu_encoder_get_intf fails [1].

WB encoders won't have hw_intf. The code checks that either get_intf
or get_wb succeeds.

>
> [1]
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2263


-- 
With best wishes
Dmitry

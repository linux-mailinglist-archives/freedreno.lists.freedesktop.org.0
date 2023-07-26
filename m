Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12717764250
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 00:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F1510E09A;
	Wed, 26 Jul 2023 22:59:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B706B10E09A
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 22:59:05 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-d08658c7713so283016276.3
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 15:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690412344; x=1691017144;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LLPxlJY6xMNij1uxNCT+9JnGOcfjMwxi0ypn4kc4QcI=;
 b=sGsJW/DXs0JW1/Y5dDHNFxcGOHCXYlCLqtnXO2cW6DVNTcYjm+3NFC03qwZK6Dw785
 cff2pdY9nWocIt5Sv0qtguxPYDT67ATu0SpPYAVJeq5Bz+QEsYtcMCzuHhXu+hgy9XVD
 PU9eHCm3pAt7qm0iET1TiHlrcd8T/MEduaMAmxYp06ZOlat40YXQrI+bIJGfgWUyMS9Q
 8XlfAD06WNpxJC3mISQN5ErtIGEsjetGmjyvlRwUQVdyzrrMn7lbzMoVZtosDM0yolXK
 xElKzvY+ZfquZ7xO7kR7T4P5hqE5Q3c5JdmYoS8juI7hGmUGFlRwy9/4KYMbWKj4slcB
 vqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690412344; x=1691017144;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LLPxlJY6xMNij1uxNCT+9JnGOcfjMwxi0ypn4kc4QcI=;
 b=ESIzhyJzPpM94B5u1xcbFKyQtlAMixmLBJFZmM5H4jC62eyl6H+5sW8zBF6NVpoO4C
 kCXGlyJ9s9m6nDDK6C04z8bBuNKZD9+sQTXrJErNCSj79BJg17xXd1jgxD5lNWQMR6pK
 LFVCl7hkZ0Zt62UETHDZmuqs/Mu6DWsi+eBu5EWcnvcgtpMZU/73WbwlcF8D17bIvMyC
 N8NuuqDzwrpnUiuKmfC18L5SCgu0y7qo8HGHu9uTxvHFdO7g1Z58kxp9fLV6HhwMCUpw
 nj2VyQQr1xHyyMHYtHjKlaY0iMApxRiW1IwFzjDJN9m43AFm11+MN1+DTp8gQFG+4IWQ
 zehA==
X-Gm-Message-State: ABy/qLawPKkJvPK9Ts7bHMabG056gUrqlyI8pDE0wc9dM+6mBmJhREd6
 3IHdO+Vdoawne9TPBpvDHvj8VhDCBNIJO2aYJ0rMMw==
X-Google-Smtp-Source: APBJJlEhMIIJoDGx1VebdDsKuEknBTMFauNXvw2DPBpUTgTScfeiZkBukCTHaKhe0y90KSQm9unWqbnhQGCyDKLDgNs=
X-Received: by 2002:a25:ca13:0:b0:d0b:f845:c831 with SMTP id
 a19-20020a25ca13000000b00d0bf845c831mr3393948ybg.13.1690412344670; Wed, 26
 Jul 2023 15:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-5-dmitry.baryshkov@linaro.org>
 <61b0792d-aa62-03ea-bb2c-aa9392251519@quicinc.com>
In-Reply-To: <61b0792d-aa62-03ea-bb2c-aa9392251519@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jul 2023 01:58:53 +0300
Message-ID: <CAA8EJpp+uO_BZVQ9A+ZjKe3+b_H=xJc_yCfd8bKSPenU8Mf5FQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 4/6] drm/msm/mdss: populate missing data
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 27 Jul 2023 at 01:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> > As we are going to use MDSS data for DPU programming, populate missing
> > MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
> > programming, so skip them.
> >
>
> Can you pls point me to the downstream references you used for msm8998?

msm-3.18, drivers/video/msm/mdss/mdss_mdp.c

See the function mdss_mdp_hw_rev_caps_init(). It sets has_ubwc for MDP
1.07 (msm8996), 1.14 (msm8937) / 1.16  (msm8953) and 3.0 (msm8998).

> Was that just taken from catalog? If so I would ask for the reference
> for the catalog too.
>
> As per the register the decoder version is 0x0 and not 1.
>
> Even encoder version is 0 from what i see and not 1. Thats why a
> dec_version of UBWC_1_0 is not doing anything i assume.
>
> Some additional questions:
>
> 1) Does the whole chunk in dpu_hw_sspp_setup_format() which handles ubwc
> programming need to be protected by if (ctx->ubwc) now ?

It's hard to discuss the question which is irrelevant for this patch.
Nevertheless, yes, it needs to be protected because e.g. qcm2290
doesn't have UBWC support.

> 2) The values of UBWC_x_x dont match the values of DPU_HW_UBWC_VER_xx.
> What was the reason for the catalog to go with DPU_HW_UBWC_VER_xx in the
> catalog for the encoder version in the first place? Because looking at
> the registers UBWC_x_x is the correct value.

Huh. This definitely should be asked next to the code that you wish to
discuss. The DPU_HW_UBWC_VER_xx values come from the first DPU
revision.

>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
> >   1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index ed836c659688..9bb7be4b9ebb 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -264,6 +264,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >        * UBWC_n and the rest of params comes from hw data.
> >        */
> >       switch (msm_mdss->mdss_data->ubwc_dec_version) {
> > +     case 0: /* no UBWC */
> > +     case UBWC_1_0:
> > +             /* do nothing */
> > +             break;
> >       case UBWC_2_0:
> >               msm_mdss_setup_ubwc_dec_20(msm_mdss);
> >               break;
> > @@ -502,10 +506,22 @@ static int mdss_remove(struct platform_device *pdev)
> >       return 0;
> >   }
> >
> > +static const struct msm_mdss_data msm8998_data = {
> > +     .ubwc_enc_version = UBWC_1_0,
> > +     .ubwc_dec_version = UBWC_1_0,
> > +     .highest_bank_bit = 1,
> > +};
> > +
> > +static const struct msm_mdss_data qcm2290_data = {
> > +     /* no UBWC */
> > +     .highest_bank_bit = 0x2,
> > +};
> > +
> >   static const struct msm_mdss_data sc7180_data = {
> >       .ubwc_enc_version = UBWC_2_0,
> >       .ubwc_dec_version = UBWC_2_0,
> >       .ubwc_static = 0x1e,
> > +     .highest_bank_bit = 0x3,
> >   };
> >
> >   static const struct msm_mdss_data sc7280_data = {
> > @@ -550,6 +566,7 @@ static const struct msm_mdss_data sm6115_data = {
> >       .ubwc_dec_version = UBWC_2_0,
> >       .ubwc_swizzle = 7,
> >       .ubwc_static = 0x11f,
> > +     .highest_bank_bit = 0x1,
> >   };
> >
> >   static const struct msm_mdss_data sm8250_data = {
> > @@ -574,8 +591,8 @@ static const struct msm_mdss_data sm8550_data = {
> >
> >   static const struct of_device_id mdss_dt_match[] = {
> >       { .compatible = "qcom,mdss" },
> > -     { .compatible = "qcom,msm8998-mdss" },
> > -     { .compatible = "qcom,qcm2290-mdss" },
> > +     { .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
> > +     { .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
> >       { .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
> >       { .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
> >       { .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },



-- 
With best wishes
Dmitry

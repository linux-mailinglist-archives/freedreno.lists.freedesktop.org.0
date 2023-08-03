Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B9176F57E
	for <lists+freedreno@lfdr.de>; Fri,  4 Aug 2023 00:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DB310E67D;
	Thu,  3 Aug 2023 22:13:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D6610E67D
 for <freedreno@lists.freedesktop.org>; Thu,  3 Aug 2023 22:13:27 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d09ba80fbcaso1633704276.2
 for <freedreno@lists.freedesktop.org>; Thu, 03 Aug 2023 15:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691100806; x=1691705606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pKrgIpuXRGic6b6C+k3mhH+LzXEqNBKYd3T00BcALmA=;
 b=jPKgu+iiT2nEak06cLi5GKVS0paWCjfjSa8tgHxQjtr3eIHOBCiQN2V7RkbMu4Wff2
 QovtecUd9NiigJRkm2kqlPn36VyKhaOFaMeLwKT8VlJdT4fpQWUKN/QSZF5kFv5TvO5x
 GevgBbGfzvoCyN2QkM+87T5++4frW5rkkUYZK4FQiNYqGimVjVZeWLVhUI75+98lLgKy
 Ky/GJc+J731K10FMbY0KIS5VwWht98Z2sB5uskZx4WTdaDeC89ZAIueiLLTjkX1FSOlv
 TQeh4MEmI/AzppxZxXUIoW14tqQU4YLNd/MdHfvZznwp8zKU5sdyjgZir9OGC9i+nHRk
 Dqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691100806; x=1691705606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pKrgIpuXRGic6b6C+k3mhH+LzXEqNBKYd3T00BcALmA=;
 b=QiFCtJUspHI8/I7Uue5T8K9b2dkuaH3Z12aRUlvsxlWLrDLVLEhOSO8qCjLQ+2lNnp
 W9EFntd92Q+nebcL46A5BGhnujDGS2C7gTjfteHudqvzg6gGLqtYgHSpQdMUPd21L6lQ
 JpnbskbtwSX7MxgXRWjN4XDS0MO+YHXC0YX8MLt+csHylB1DpyqFj+GyghYnOfR9jckF
 4CnRLWvHBNs0777Ccgc1cvOEK57sl+IamyMxLCY2I6hewgAgjJsQbFgOyqs7zf0qHd8W
 +KwmvpHgYjZSms25qjACgKQjrfVX7Vd45n/4W9GQV9Nf9fEnyfurA8c7V9tnPh5oGB72
 COhg==
X-Gm-Message-State: ABy/qLZDoSuwuVUNbQjMaYn2Tbb7G03NQKOr+WZ6WlGOUbhsCHr7q+PU
 HZMqXF+ID7r0vQRH+K+BCqTxl4386JSS/zj1Zgek9w==
X-Google-Smtp-Source: APBJJlHZ7yvBgzplN6wNzGDnzG/pCcR0AGkTrE8Gsc0Q677Ie2EiJpTWqq5VDD/PB1rxSTWDCvZtg/T3zp3k8g0au60=
X-Received: by 2002:a05:6902:1895:b0:d05:f537:da99 with SMTP id
 cj21-20020a056902189500b00d05f537da99mr20258859ybb.46.1691100806499; Thu, 03
 Aug 2023 15:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230803194724.154591-1-danila@jiaxyga.com>
 <20230803194724.154591-3-danila@jiaxyga.com>
 <CAA8EJpoBZBLYQ5RUW7nGo+wsma2XiON9+rK8N-gjnfWTkb-7rA@mail.gmail.com>
 <1691097186.296866515@f749.i.mail.ru>
In-Reply-To: <1691097186.296866515@f749.i.mail.ru>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Aug 2023 01:13:15 +0300
Message-ID: <CAA8EJpqdQ84wq03swhOd6Qz11QzdhBbW=r0cLNuoXsEY=vT9uA@mail.gmail.com>
To: Danila Tikhonov <danila@jiaxyga.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dpu: Add SM7150 support
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
Cc: quic_rmccann@quicinc.com, dri-devel@lists.freedesktop.org,
 liushixin2@huawei.com, krzysztof.kozlowski+dt@linaro.org,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com, airlied@gmail.com,
 rfoss@kernel.org, davidwronek@gmail.com, quic_khsieh@quicinc.com,
 quic_jesszhan@quicinc.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, robdclark@gmail.com,
 daniel@ffwll.ch, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 4 Aug 2023 at 00:13, Danila Tikhonov <danila@jiaxyga.com> wrote:
>
> So here too I add new sm7150_vig_sblk_0 and sm7150_vig_sblk_1 with v3lite?
>
> static const struct dpu_sspp_sub_blks sm7150_vig_sblk_0 =
>     _VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3LITE);
> static const struct dpu_sspp_sub_blks sm7150_vig_sblk_1 =
>     _VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3LITE);

Yes, please, close to other sblk variables.

But the priorities should be 4 and 5 (and 1, 2, 3 for DMA).

>
> > +static const struct dpu_sspp_cfg sm7150_sspp[] = {
> > + {
> > + .name = "sspp_0", .id = SSPP_VIG0,
> > + .base = 0x4000, .len = 0x1f0,
> > + .features = VIG_SDM845_MASK,
> > - .sblk = &sm8250_vig_sblk_0, // &sm7150_vig_sblk_0
> > + .xin_id = 0,
> > + .type = SSPP_TYPE_VIG,
> > + .clk_ctrl = DPU_CLK_CTRL_VIG0,
> > + }, {
> > + .name = "sspp_1", .id = SSPP_VIG1,
> > + .base = 0x6000, .len = 0x1f0,
> > + .features = VIG_SDM845_MASK,
> > + .sblk = &sm8250_vig_sblk_1,  // &sm7150_vig_sblk_1
> > + .xin_id = 4,
> > + .type = SSPP_TYPE_VIG,
> > + .clk_ctrl = DPU_CLK_CTRL_VIG1,
> > + }, {
>
> --
> Best regards,
> Danila
>



-- 
With best wishes
Dmitry

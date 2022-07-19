Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319FA578EE2
	for <lists+freedreno@lfdr.de>; Tue, 19 Jul 2022 02:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C611E112412;
	Tue, 19 Jul 2022 00:12:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF131139B4
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 00:12:55 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 a14-20020a0568300b8e00b0061c4e3eb52aso10601390otv.3
 for <freedreno@lists.freedesktop.org>; Mon, 18 Jul 2022 17:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uQR+n69n3dnYzqYwl3ly3mEn2ZxY8NPwKeE+kxZpS2M=;
 b=fJcui/2VkpHokc0d1YV8OjT923oZ5Oc+KoVy7FjZmyH1L/6cmgxWpbexuOmc0YKmZk
 QDyyZc7KOfterT0xRHhb4S5PTWC2f+MIFb0+d3F3b3jmiii9CDrUVfi8zFGi+DpWYrSi
 LylhOa2dqucibVAMfjQS8IJGOkt8dNfjrC9NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uQR+n69n3dnYzqYwl3ly3mEn2ZxY8NPwKeE+kxZpS2M=;
 b=ip+YJQIWAtF/dYgCuW9HpgpWxHRTolbMT5y8T5QB7Ilqpb2kxe6kBxHRNr5VEkrvzc
 cmaUH576sSu7/byK2+ARF6YozVFuCsUFTrPajIO2vwpvF0Y0oclF8qIMpIfb1/8ZZouD
 6c3H/llDDnLlvKS4rrusbr+tP5BQZK6fii0NJrX+0cLhr7Qz3rFJj/OBVwYYc1uIDdcI
 IxeYgOFM+Ii8M8u8/QcfR4rT3kflyHhbna7GRaVRaThgeuiVDrqfmanKdHDuMiO4pUcp
 8+ypgirQcHwvGzv55c2QMOf5kVReAojQYWqJ7Dj2GiIRISM8HOMUgen8URf5Wfwoj2dl
 TJdA==
X-Gm-Message-State: AJIora8H1HvSij8c2ZejdEX3fNIBMtsV1KHndFuNsXwSshNMjER1Az/J
 jmlZdwIfdkKI3IdsTjcrr5uTTjfo7onTbbQWBjNR5Q==
X-Google-Smtp-Source: AGRyM1tj45Y8RF+Rd3jNFk+0LcP8DpTPSuHkSuaqNuMLN/z98asVBWyEOSMFjlQpphhLUMzVXQGKWxbYTin3OQ1opFA=
X-Received: by 2002:a05:6830:2aa0:b0:61c:9501:bb26 with SMTP id
 s32-20020a0568302aa000b0061c9501bb26mr5172172otu.73.1658189575184; Mon, 18
 Jul 2022 17:12:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Jul 2022 20:12:54 -0400
MIME-Version: 1.0
In-Reply-To: <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Jul 2022 20:12:54 -0400
Message-ID: <CAE-0n53StEjfWrNwmSZ5U-6M-EqEbaXHU+A69a-9-CTxw5GdiA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/9] arm64: dts: qcom: sc7180: split
 register block for DP controller
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-10 01:41:25)
> Follow the schema for the DP controller and declare 5 register regions
> instead of using a single region for all the registers. Note, this
> extends the dts by adding p1 region to the DP node (to be used for DP
> MST).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

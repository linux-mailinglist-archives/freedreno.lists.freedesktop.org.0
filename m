Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB359CEED
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 05:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D1E95F0E;
	Tue, 23 Aug 2022 03:00:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D9993674
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 03:00:16 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11cb3c811d9so13623724fac.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 20:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=bjV5e2UkotDtwOzVATF34/U7fC7PX6CJAnehb3qpJfY=;
 b=bHx2Z/grCVb0PTuIK5PvVrWSZQOTpvcU4vPeAw8uHdD1AZWhLrGeaENHl9cLaIZyDp
 YXe6AqegtoZLhKtNGxcWGVzvT32gU8doei9PfA2REcjXeOIAdxSBTDO7e+tIbAA5c2EM
 4Wsxcoh9wYt2FJ62xjiIsrvsIHK4478WkvRFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=bjV5e2UkotDtwOzVATF34/U7fC7PX6CJAnehb3qpJfY=;
 b=wjU3bcez58MKVspSn57QhV7adJ7oYdAcz/rU8AfdkTOU1bt1wWKT9Z4gtSy2folkC6
 v5TDR0Cw+nCgISeU/w/tcvRF6NjoPyKfsHxnuGxHXCgCMMWLexk1UPbeSlspTAWB6ms8
 HpkdMswrVO6I8A9jmpTLepv5eDKzvKpVterXtrX8L7yxBxadLSLxIYk89SFPezhae2A5
 +2e8u1swo6MBIo3qe80oCP5IV0bmDM7qGhddHsXYtDphJGZebfWGoznzfDZnPlMI8AqO
 pLiEDWsg0e9ZsViJU8qPSY2qWgtiVATqs3a63iDb5NwMnauBKgkXeU0avWC7a/tSQPl6
 nXIg==
X-Gm-Message-State: ACgBeo3JB72f2U234D4FWxB2kLapBhlD/XPEgGcqRfX1cADluUCmGaFF
 9LDSlDI8Qne+rOYPUM/tSugfyRXzNrJIhuryAvhRig==
X-Google-Smtp-Source: AA6agR6NuFJEoswZf0ydPYca5vlPJobYmiK3bvyMD5ngQqSkejjppZMeHrTnKI0kG94UUhEVO6QDseyu/ixpu/5VVqM=
X-Received: by 2002:a05:6870:e408:b0:11c:37ad:773a with SMTP id
 n8-20020a056870e40800b0011c37ad773amr555285oag.44.1661223615728; Mon, 22 Aug
 2022 20:00:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 22:00:15 -0500
MIME-Version: 1.0
In-Reply-To: <20220822184900.307160-4-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
 <20220822184900.307160-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 22:00:15 -0500
Message-ID: <CAE-0n51CNfAa1oRL4R1csdM6Q9nbAOX8UT14AOA33ZDZ-WmP+w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/3] dt-bindings: msm/dp: handle DP vs
 eDP difference
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-22 11:49:00)
> The #sound-dai-cells property should be used only for DP controllers. It
> doesn't make sense for eDP, there is no support for audio output. The
> aux-bus should not be used for DP controllers. Also p1 MMIO region
> should be used only for DP controllers.
>
> Take care of these differences.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

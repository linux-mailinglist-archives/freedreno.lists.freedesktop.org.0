Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CFD54308C
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 14:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2123C10EF01;
	Wed,  8 Jun 2022 12:38:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A0210E759
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 12:38:15 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id o7so7901136eja.1
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aEGXQECe4H9Yr1drGqc8tKF4uy6G/ckZC8sU26gHtJg=;
 b=b0/e4QaChXD6ECkdPGCyuGyJUawjE5WGDcCNngEWwicQcNjDBbxo96ujUWEmtKrU2G
 ZMV1/fftHeM20VSZ1GnA3cO3UI2z2DsvrBZNPz7+jiUrFVPZIBy0sgoNg5p0Pfy1zMZF
 YNPucSatWgbT1iWYyD9lZJ1QDWLyJbfaTO/sOfHHfuGk6h60/vmfjohGEYeGC7QA6Ijl
 sMHq3Sn0Kc6zK80Gnb/dC/bhil/qMHH5H6HB6ULVl1KM9OQgbQSpzqcyx6JC0Ie/CTlr
 vOsO7I/mJ97tFrhOLU/JqhZnShBHwZR5U33m/zhkDAyJ/AmCyI1K/R4Fp11qMP6Sc0TM
 rxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aEGXQECe4H9Yr1drGqc8tKF4uy6G/ckZC8sU26gHtJg=;
 b=peBymsSK8onDvu0MzA5s/FwJQCxkDG131lAyBIYLVEpEBh0KZQp3Yrsbjg7fmeQgVG
 PZt2Dj7gct2PBYOiLGIlkLyPZiYS1pXJu5YvbBqfW1GeQ8aM/6WRC83GcqFnAxr/Mgq1
 65SjBYgR4RpVPWbS+yw6FWBZj7iyAJnCYybeYNYfmpY9wvx6mlY5vWP32n/mGTpvM+Ru
 Ee8AluoRZeNqIyZCpgf33c5U9V2DwGTT53zwVfUwjmXjM4jcRw0EUAKvK/pCNiCuijJP
 wlsrGYriBgSZHxnpk3BTlH1eLRC8OCDleeq1DhlhZpPR3agPvojpuTRORDou772V0vHF
 y1SQ==
X-Gm-Message-State: AOAM532tcZyvW6Cb9DEoqV5dan9rQilCMgxYu6ev5r0EnGJaoKKkxNhm
 uskUvhRQO3IIbOq8Zgoot3fHIg==
X-Google-Smtp-Source: ABdhPJw2db8NS2pKzLZNRjdCIdLmNenvGRa27Y2xy0C/8AXs/h3fBZJZTn7uOXirBYfkc7BesWdcBA==
X-Received: by 2002:a17:906:414f:b0:711:ce99:69ec with SMTP id
 l15-20020a170906414f00b00711ce9969ecmr14718867ejk.724.1654691894016; 
 Wed, 08 Jun 2022 05:38:14 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 t20-20020a1709066bd400b006fea3702e56sm9102856ejs.79.2022.06.08.05.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 05:38:13 -0700 (PDT)
Message-ID: <1fa92614-d08f-162a-da3a-28fa9388d314@linaro.org>
Date: Wed, 8 Jun 2022 14:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 03/12] dt-bindings: display/msm: hdmi:
 mark hdmi-mux-supply as deprecated
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/06/2022 14:07, Dmitry Baryshkov wrote:
> hdmi-mux-supply is not used by the SoC's HDMI block, it is thought to
> power up the external logic. Thus it should not be a part of HDMI
> bindings, but it should be declared at some other device in the DT (like
> HDMI mux, bridge, etc). Mark it as deprecated.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

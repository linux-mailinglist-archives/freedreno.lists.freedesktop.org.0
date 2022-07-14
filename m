Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877E3574934
	for <lists+freedreno@lfdr.de>; Thu, 14 Jul 2022 11:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F3A112D65;
	Thu, 14 Jul 2022 09:38:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A1711A9B3
 for <freedreno@lists.freedesktop.org>; Thu, 14 Jul 2022 09:38:32 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id t25so1861377lfg.7
 for <freedreno@lists.freedesktop.org>; Thu, 14 Jul 2022 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TLtLAzqKjh0PR2hCiXTpWedWr6UZ/eh69O/Av6dFIUQ=;
 b=OrBeTbStBItEd8xp+RbyOHCOHfiOQOJrv5ANEz6qxRGixDOxMAJ5IzUuiOQejXwRyZ
 GMkAV6A+Rweq3b6Zxv0mjMm0eoJjr5PRDAQoZco1jCPPb6IAeQSgEB2x3wySZxwH92CG
 v7eIrrSCr/lzKx0racL0bqV858CJVvFs+RCUV9Iz1I0MBxltwBK4evG6S/Rrl/H7V2lq
 Ly6NpupvlRiBmGyepoRqeTavRvkISkRMGu8PAVRfuuZ3Oo+jFfV9oe/nSZlU3EbSClps
 DnYZKmYZJgdiBMW09JWHhs4cqCCLdFQrr5ck858Ixns9msDblNZPtZkKYbuhOiwYqNSY
 /OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TLtLAzqKjh0PR2hCiXTpWedWr6UZ/eh69O/Av6dFIUQ=;
 b=WL3XOB3xgUu60I8GPWrfriW58fpjNRHMGoVcThe2W+a0Gz70AsL3md/c8vq43dmNVz
 sxxscmbM1g6DyZ8fETUeSj7tHGT88j0DVEi+WclV8CN8LvW38b44gGgeC5T5LpdBIX2w
 5ut5qACGuMn91S5xDN/BD4eTT8ODTD3brmo9SkbGuqlmtNtqOv8DM92/z8lWjfuaX8cm
 9QSLSRwxiwJMHY3vCMRJu/CFlC33m175JZBTC8DiUYLWVhk532m/6ejd9xbYUFO47MWl
 nTTgR2hHXwLidPjMCQLKkYUWvIvyn/jVqGWxUhv11kbvN/zttA8jHur41WiVkvZafzxa
 Ufpg==
X-Gm-Message-State: AJIora/1zbZjcKvppoCtGlH39SEpGj+brH+mW0Iw99rs1VcIuU1XQOUQ
 3QqpDljfujYs51AleZebRMwSRA==
X-Google-Smtp-Source: AGRyM1tc/J/ECeZYTPp1hWc06zGMIdJAwt8bxeNi6BFWllabpCBNba0Lt2QRG5hj0HKnx9MN0GD8zQ==
X-Received: by 2002:a05:6512:2308:b0:48a:f9d:7389 with SMTP id
 o8-20020a056512230800b0048a0f9d7389mr3812939lfu.235.1657791510561; 
 Thu, 14 Jul 2022 02:38:30 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a056512214200b0047960b50c26sm262242lfr.78.2022.07.14.02.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 02:38:30 -0700 (PDT)
Message-ID: <bd84ef20-e6e1-74e5-5681-7aa273d5255c@linaro.org>
Date: Thu, 14 Jul 2022 11:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda
 supplies as deprecated
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/07/2022 10:41, Dmitry Baryshkov wrote:
> The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
> functions from eDP/DP controller") removed support for VDDA supplies

No such commit exists in next. Do not reference unpublished commits. If
this is your tree, be sure that it is in next.

> from the DP controller driver. These supplies are now handled by the eDP
> or QMP PHYs. Mark these properties as deprecated and drop them from the
> example.

Right now I cannot judge whether this is correct or not. I don't know
what's in that commit, but in general driver implementation changes do
not warrant changes in the binding.

Best regards,
Krzysztof

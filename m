Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3ED574945
	for <lists+freedreno@lfdr.de>; Thu, 14 Jul 2022 11:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEDB94555;
	Thu, 14 Jul 2022 09:43:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB1591702
 for <freedreno@lists.freedesktop.org>; Thu, 14 Jul 2022 09:43:57 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id x10so1046757ljj.11
 for <freedreno@lists.freedesktop.org>; Thu, 14 Jul 2022 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wbCsquwN1alwH8J3M5l4Cq/ivX95MU45M7AXoqrgl2Q=;
 b=VDTrfZBM8ClaRXetfV8CdxQ52IOBK9xRGfCl1ywFDqNZYyUfYrotPyc/Jyc9V237jq
 dQTXDJFu29YJ70kaqVKRgMLFp9d2FxNHQa7y0u4ey/KbcZqg/UltpGjY/uF2PvToXPJP
 7oazL/GFF7SdJ04NIjspWjFwsoo4iJ1NiQNi1aMTygLwiwChwtxyb9HD7mBWxhDnUZpj
 zpbqM0JIzN8Cbt5oQ80Czb8RobDEtf/x8WAT5LtaejgrCupwDwwpaSy/Dz5eAnrl+2Gp
 p1dwI/uae5d40inFHeYY1UFLyuct6WfsBXuGryhmhDNa7G8c6jP0NBY0tjlBMO5U9/d6
 BsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wbCsquwN1alwH8J3M5l4Cq/ivX95MU45M7AXoqrgl2Q=;
 b=mwr6kw7e85mJ5EmZ1mgL0L6N91XcI+jtsgM9d3Jw8bTGGuybvC5wPQP1PnQeuffaUP
 j23LuSnGtY4U8Xm7S33fCLzswizL5lX+4pqi5hLf1DoTLuzsjFHZGqIYMfDpCYRv76o6
 luB3iYgLWf2qlZTfdFUGwC5B9jfHbY3NkG3jXySwCDjLwEy+kuXAZKzDXVIU41POIklt
 Mer2/x4FeMmmBV/o2HcU68JSLQAl7waH9jvogL56krGJIm6vhVdSUvG1WFN2jOdz7Zrl
 5V/A9B/7dHZg5ZPez4HxfEUM7PoK9ObnjQdQYPzow9ZmDnueAiGd0jL7XicbeaX0wmev
 b/Xg==
X-Gm-Message-State: AJIora+LzZ3TDjOdm2sSrldgqWhkWYhvGRBx81pfKweK5Z8wnh4MMdih
 dYiljfw+4WxlJls1x4ckxwgrRw==
X-Google-Smtp-Source: AGRyM1u8QlejMdqMFEqmtkhj/2HQFasgTk3M/jud4cK/2ArinXKI5Fjk/WF8hOCTkbuUXx2INzsrHg==
X-Received: by 2002:a05:651c:243:b0:25d:9aa4:d7c9 with SMTP id
 x3-20020a05651c024300b0025d9aa4d7c9mr1424686ljn.35.1657791835374; 
 Thu, 14 Jul 2022 02:43:55 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a2ea3d7000000b0025bf6099cdbsm191079lje.78.2022.07.14.02.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 02:43:54 -0700 (PDT)
Message-ID: <6e47e212-27a0-0adc-40c4-dea272fd2d72@linaro.org>
Date: Thu, 14 Jul 2022 11:43:51 +0200
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
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 8/9] dt-bindings: msm/dp: add missing
 properties
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
> Document missing definitions for opp-table (DP controller OPPs), aux-bus
> (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EE95A24D4
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4204310E7F7;
	Fri, 26 Aug 2022 09:49:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB8D10E815
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:49:08 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z25so1327224lfr.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UN9UNIYBZ5uGaqYCoTZ9HAq/Y6zWrMkzm6pHK+dxe5A=;
 b=L5OXYT+liCL+/QGJXKJIyiz5VcXhwEDMb5oV0Pve/89FEkMLfV3mgowMShnYIC6CKG
 b0LHap0ys0CWPTK4HJCusslBIXgYoBy9EnQsUoUBy/9xoQNLDSivlfJdAP192l7qu2Ol
 Ymk2z1OwlXV7yoVbZYOHEF3PB4yy/c+BJ+ub38cvBeSMD4tVL8UZL9PRRCl1btg7hAwR
 D4lrN31eYUG4xEZwWSOFB8QSmG8EdPPmutENh90ugKark7fVWEUmQMNYgElpaKy01tLN
 QybG5XMkIqTG58E5N31Fb3uU8Q+e8k/JmkkKN4YCUgT1CQiYxoqP0Y8bezu9u4Ym+/ui
 iTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UN9UNIYBZ5uGaqYCoTZ9HAq/Y6zWrMkzm6pHK+dxe5A=;
 b=Xfg6/5YUQDc3QB9bPx0O2aZ/EucIZsxVofKhcz9N0/b5AIqD00WPyAJRwGAaz9+qiK
 hiMoXIVm98o8FT4jG6x7aY6luNxOjU2beAFBdTEt/Gh10L6hdSwm9uuE0JipeaQXzDya
 oZjiKyt/1n+Iq3ZcLbGdEGvIltZtF51kjsA85eEABhU0le6WE6eYrJVSa78MInWcOkIu
 yooG9R2GOrKEbakCUyEQeMf/JXbwgDG1eTpcJzqLy+kIYZT8FL8kL7QS3mcQSyfCc4fa
 1QTUFbF36YPoTw0up4aikGCvsw8wXLa+v7G5Tz3/P0oGOgdaQZsl72GqAUsMdbXsrlbk
 y10w==
X-Gm-Message-State: ACgBeo1PxHg+Y1yG4ni+WijncFOCu2sDYMfeu/t0MGNSHMr6rccFHqZT
 xwZV6ACe6V0PoM0D77SGo2orvA==
X-Google-Smtp-Source: AA6agR6MpFJqQMrOTZPh3nHGr7fhGGF/zOA3ps/9gCfSND5LRAOU+SUC4fx2y97CPu544wYrT23ztQ==
X-Received: by 2002:a05:6512:3159:b0:492:d660:4dd7 with SMTP id
 s25-20020a056512315900b00492d6604dd7mr2101345lfi.204.1661507346709; 
 Fri, 26 Aug 2022 02:49:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c6-20020ac25f66000000b0048afe02c925sm320409lfc.219.2022.08.26.02.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:49:06 -0700 (PDT)
Message-ID: <53c72da6-b632-058d-9e3d-b00c286d9e09@linaro.org>
Date: Fri, 26 Aug 2022 12:49:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
 <20220817062059.18640-3-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220817062059.18640-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/5] dt-bindings: display/msm:
 dpu-qcm2290: add missing DPU opp-table
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/08/2022 09:20, Krzysztof Kozlowski wrote:
> The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
> opp-table, so reference it which allows restricting DPU schema to fixed
> list of properties.
> 
> Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


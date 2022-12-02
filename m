Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC029640029
	for <lists+freedreno@lfdr.de>; Fri,  2 Dec 2022 07:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDB710E071;
	Fri,  2 Dec 2022 06:15:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20D910E071
 for <freedreno@lists.freedesktop.org>; Fri,  2 Dec 2022 06:15:37 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g7so5933674lfv.5
 for <freedreno@lists.freedesktop.org>; Thu, 01 Dec 2022 22:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VN8FP/RUaV+zUxP2MmDTHFuGbxLaXmlrobBE54QvUGU=;
 b=B94KH7/+MPgOOldQUJtFKXLx5k5rPJMWPagVyNJqTBYAPrKqi/XKTfF6WLkdJvWgta
 dmpuqYq45laZOgEl1c1kLoYYvcSLvmc4H2Zd76TW3xYfFn91QQs6ehRu/cluqsWhEch/
 X0WM0mKItuypItMrH9UpXMBrOlAc5KgZPb+cyoHmDZ128enPn2/eg8Ptb4CfkhUs60oy
 21zxBARtPO+jHwnKOSPKHns9UBkn72Dd2V6tG3Ne++lM4+FCnJaEgUhWAGfD3Xv0Qs0W
 na8wgzCJYIKNryoFVJnZnVaN6KPhqYq5quC5ih1NKbov6bceCxZhuUspXkbHbYY+9kz9
 iBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VN8FP/RUaV+zUxP2MmDTHFuGbxLaXmlrobBE54QvUGU=;
 b=3DG8YsIzxccD0lcHYrBNFyKMr5zXyzZLNuWjB2FKfZlmRpVgNSB2pHLl3O+xjSvSCq
 l6Uxhh15KmtLsekqd0qHlceHp2ttXGJR2jR37XcnOL48dlp6/a7MzK3kWPWn8dxdHh+N
 dJnZt+Pe3olYuY8x3AFhy9bxwBS+LBSaae3EmIfWpX65mYwBR6kQSLvQczOvnhSqSylK
 JJ3CYcQTcUH6q6Oodt3lGXhBBswDvheuRpdVVgwtnr6jjTrBBaoQuIllvPfxjQqk1Snc
 qMi6VfK2zlD73hLJlOwDGD7FptsLQ/ZYtW0bH9zF93hYWDM9sC2p6jaxV2wkuIVcjoaI
 pD2w==
X-Gm-Message-State: ANoB5pllitDIWyevv6wwE3kefIHI/gl9tD2jVEZ4aSaGKMJItYCc7uYq
 l5xLM5/S5hBZ0hIKLM/tTUJeIw==
X-Google-Smtp-Source: AA0mqf7H3gdqVppExL9ZynWx8Zj/mUNe7AYQKRTJ1LKfkyvfhfWKsGnBzHLDWHjb/V05OjYT9/3snQ==
X-Received: by 2002:ac2:58d7:0:b0:4b4:fbce:606b with SMTP id
 u23-20020ac258d7000000b004b4fbce606bmr11712982lfo.27.1669961736149; 
 Thu, 01 Dec 2022 22:15:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a2e940e000000b0026dcf81d804sm521425ljh.31.2022.12.01.22.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 22:15:35 -0800 (PST)
Message-ID: <37ab278b-7f32-b162-c62d-79e695ff82ed@linaro.org>
Date: Fri, 2 Dec 2022 08:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1669933049-13106-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1669933049-13106-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 0/5] Add data-lanes and link-frequencies
 to dp_out endpoint
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/12/2022 00:17, Kuogee Hsieh wrote:
> Add DP both data-lanes and link-frequencies property to dp_out endpoint and support
> functions to DP driver.
> 
> Kuogee Hsieh (5):
>    arm64: dts: qcom: add data-lanes and link-freuencies into dp_out
>      endpoint
>    dt-bindings: msm/dp: add data-lanes and link-frequencies property
>    drm/msm/dp: parser data-lanes as property of dp_out endpoint
>    drm/msm/dp: parser link-frequencies as property of dp_out endpoint
>    drm/msm/dp: add support of max dp link rate

Patches 1-3 are missing, patches 4 and 5 don't have proper threading. 
Please resend the whole series using a single git send-email command.

> 
>   .../bindings/display/msm/dp-controller.yaml        | 22 +++++++++----
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  6 +++-
>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  6 +++-
>   drivers/gpu/drm/msm/dp/dp_display.c                |  4 +++
>   drivers/gpu/drm/msm/dp/dp_panel.c                  |  7 ++--
>   drivers/gpu/drm/msm/dp/dp_panel.h                  |  1 +
>   drivers/gpu/drm/msm/dp/dp_parser.c                 | 38 ++++++++++++++++++----
>   drivers/gpu/drm/msm/dp/dp_parser.h                 |  2 ++
>   8 files changed, 68 insertions(+), 18 deletions(-)
> 

-- 
With best wishes
Dmitry


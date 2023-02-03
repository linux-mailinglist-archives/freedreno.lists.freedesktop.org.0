Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA8A68A1EB
	for <lists+freedreno@lfdr.de>; Fri,  3 Feb 2023 19:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C8D10E852;
	Fri,  3 Feb 2023 18:24:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B6010E852
 for <freedreno@lists.freedesktop.org>; Fri,  3 Feb 2023 18:24:13 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id m2so17679071ejb.8
 for <freedreno@lists.freedesktop.org>; Fri, 03 Feb 2023 10:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=54FW5UQ57LYDUUaOoRG1eWQLZeg9cuZyn479cV2SDq0=;
 b=gfqECzwoBp8RaT3ApZKy9Fa4Cy8hWotg/eNuNS60VzcZiIkoWliF7jfw3EeDDJnXct
 U7wPZ4oPF9qNZGbFnpYIpXdWE25M3/e3Dvo/SaeP9falxVNKrT4/KE5rdYZA5KD/cQ8Q
 ZWpOZzhtWTmSQFaXT0h2U8sXq5AKoQWBa+3URYLHImXAFtcuyamT1nbQ5B5v3cLRLtQT
 +n62I3dpd2CxplrS5VYb0Ne8Wvbf3rjVx7n5XXlWPZRm6YhpKWF31pBKfXUP1c59VDgI
 UWnROeNiyIb26QFY7G2GCmw4XtxTPEmsDxKs6YLVMBhC5jhHco9nOVgKUPORuyQjxuXI
 2XrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=54FW5UQ57LYDUUaOoRG1eWQLZeg9cuZyn479cV2SDq0=;
 b=xVQ8bK4AnGACFPbA84JEprQLfVw2gPBeygT8AQCOmIi4SA9TLyUcH8mAHi4uVyvgxc
 cl8LSfhc/PZvmR7L75n60gxtd2Y8ozm6swEkfnUJ2/l8iJlXi9bDT5Lark/UjETERh4m
 qor3pl6j1AQ8w7OCwq1rulePCEAbY9YDlhNsWayxCaOcQ3TzF8nJ7wzFk3vMzVehII8t
 xJPtdeWz7ugVrkcVG4KG6yILvVZnHM+p8YFs21mtYOLYgcCUrWroml6fMJhimqfukp8r
 8fuEX6A7B95nuyvE5ylxX9E+v4vld45Ag02W4W/rCYc21c/FvWZP/n5eynO8y2jkeMvB
 7Rdg==
X-Gm-Message-State: AO0yUKXlml4Qs4JSVrwCaJ8/PlgTsI9enoKFo3h67Yfk0Datqz5KRHOk
 MNck8jThRyLyiRPc9tdXmVAiow==
X-Google-Smtp-Source: AK7set/jRLYp2R0PI3fKAjVVQSQr4euujeoFEw8ZsadsYOId/b2rRWWXXOcVHh+zgdp4jBoRGCqp/A==
X-Received: by 2002:a17:906:94cb:b0:879:ec1a:4ac with SMTP id
 d11-20020a17090694cb00b00879ec1a04acmr9868422ejy.76.1675448652002; 
 Fri, 03 Feb 2023 10:24:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a170906149000b00889c115cf6asm1713775ejc.145.2023.02.03.10.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 10:24:11 -0800 (PST)
Message-ID: <27c7f706-ba8e-c743-0465-1ca2381d12bc@linaro.org>
Date: Fri, 3 Feb 2023 20:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 00/27] drm/msm/dpu: wide planes support
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/02/2023 20:21, Dmitry Baryshkov wrote:
> The review of the first half of v2 took more than a month. Let's update
> the reviewed patches in attempt to get the first half of the series into
> the acked and mergeable state. This would allow us to lower the impact
> (and the patch count). At 27 patches this series is approaching the
> limits of manageability.
> 
> This patchset brings in multirect usage to support using two SSPP
> rectangles for a single plane. Full virtual planes support is omitted
> from this pull request, it will come later.
> 
> Changes since v1 (which was ages ago):
> - Rebased on top of 6.2-rc1
> - Dropped the controversial _dpu_crtc_blend_setup() split patch
> - Renamed dpu_hw_pipe to dpu_hw_sspp
> - Other misc changes

I forgot to add it here, please excuse me:

Changes since v2:

- Renamed dpu_hw_pipe_cfg to dpu_hw_sspp_cfg
- Added a patch to clean up src add / layout for the solid fill planes
- Fixed several comments and commit messages which caused confusion
- Added documentation for new dpu_plane_state members
- Slightly reworked dpu_plane_atomic_check() to make it more logical and 
obvious

-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101AE5A23AE
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F62010E7A8;
	Fri, 26 Aug 2022 09:04:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FDB10E7A8
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:04:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id l1so1170163lfk.8
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=AjQiG4EgjmYRn7Cg4E7RAYUNnb1Av4V8ZZtkQ1I3e+4=;
 b=hHIeZDnJuAFCgFgfQpFKWOqQxdQGMecO6XOIfthmP2g9jbqB1VY8dkv94z/m3BeXm4
 Tf1N4D+Jbpakj+f5VOnzfWR2VNBljEBk98ZwgYJV8lWVsZB2Y/ycZmqsruALQMjV4u22
 DM8OF4PaoP3NGoKl97AZ5Mkm2Q6ZoP1Klf1BCZw9WbEmyVIEQPMZhKa8k6QEp1HP6BhG
 6juyhvxxLMe3PkzLHn7X8GoOgX2OlA+UzGFznNEpiE5AvaodjNKejZj1sZ11XJFLKiav
 uOUsYcOtzgVxSlKA7Dh3rSXWkfeKmVHDVLyQI2ymJM73+wT9NCyM23ibDBCE50yAZowe
 ctjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=AjQiG4EgjmYRn7Cg4E7RAYUNnb1Av4V8ZZtkQ1I3e+4=;
 b=zleITVPs4ggPirsTEcriziAEAvjw4lN0TAlQaheRYQ58Rkep6cZ5jPIp2BQhsSyf9/
 zxTYqKty4pNM8/RLNo8miOGFNeu4Zjc7XbP3g5bHacZ0b4fV65JfmGuF8G4aaGc1kCaI
 dzqpABQn9Il8WmJupK21V9JnnpHQ2HuqEi3EkHXQluPe3td02mv61KRszz/gkNaW8j/0
 tph67p70ss1Yvq5vlVGy8Ac91XrNd5OuEto/a5TJuoNyuOShO5lfRPdX2oUeKvqdbxTr
 CNtaO5T0aoG0rgHS82EJrK71O9UoTWY+pNjCo2nwPqvTPkTs2x9j7fxzSahBd01wDIDM
 PqIQ==
X-Gm-Message-State: ACgBeo2qu9WhC3qnbiQTHP2fAWFLtlIpDVhQ/CDETMHlwXEh8vCZr48H
 w6psX5g0tPbDrvpecHugsP4uzg==
X-Google-Smtp-Source: AA6agR7dh79FCl2FsfmNeeOKbVCCJZcOlRaDjGQ/56qG/mm45vx3UOGF5F3lMLWqud1gracnsstj/g==
X-Received: by 2002:a05:6512:b1c:b0:492:8835:1e4c with SMTP id
 w28-20020a0565120b1c00b0049288351e4cmr2095766lfu.442.1661504655030; 
 Fri, 26 Aug 2022 02:04:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056512368b00b00492e10b1723sm310683lfs.139.2022.08.26.02.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:04:14 -0700 (PDT)
Message-ID: <bd791d9b-3b64-22ab-723c-86003c25554f@linaro.org>
Date: Fri, 26 Aug 2022 12:04:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220623002540.871994-1-swboyd@chromium.org>
 <20220623002540.871994-4-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220623002540.871994-4-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 3/3] drm/msm/dp: Get rid of
 dp_ctrl_on_stream_phy_test_report()
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/06/2022 03:25, Stephen Boyd wrote:
> This API isn't really more than a couple lines now that we don't store
> the pixel_rate to the struct member. Inline it into the caller.
> 
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 44 ++++++++++++--------------------
>   1 file changed, 17 insertions(+), 27 deletions(-)
> 

-- 
With best wishes
Dmitry


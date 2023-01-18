Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B067100E
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 02:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A7A10E628;
	Wed, 18 Jan 2023 01:32:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD5410E605
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 01:32:08 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bk15so22195116ejb.9
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 17:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WmuAGUEJgzr87EeXDQbFh57PgRhQGPH3NOHcW4zPvxY=;
 b=UexVHvSB6XQAhPAWIJ0nYTTqeXSJILVIecAUvV/QIXmQXyxnIaYUpT5VDv9iSoqDP0
 mje+pWNsM4Z34wVsqveK0S/QVYZYeappJ/qdLBsv2qMFI9HwZiGvxcK+F+fFddFa+2/T
 VsvlKILzGCFp/gabOfKM/YxTypADk6DognnFQjOS1EkykLl3pR+nynCuZjix9VEseBIq
 hEEc/hbMMPkeEEfycet8wQ22pDUxqIbvbTIWVSMISny0FRycs5Gx8sg4xulaAKPoPOI0
 Cvola1mE7+BQtSzYSIXUlsLoRz87731JJ61Pq1AApkeeUUR1RJ4cKP20mn616JpJ/GEb
 emsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WmuAGUEJgzr87EeXDQbFh57PgRhQGPH3NOHcW4zPvxY=;
 b=bTHB57WuC898O4XyGHKZ29H0zpMz21vTHVDUMTF8zQhsLbxQXwtmciILN5P81Grag0
 R2X8DRXsCWEHT5VIyQbMavWeraeFWQUKLStr/ffDJHduqX8d+/fTS1LnyC2bU7Ca1PXe
 bFpYPh4uRFYKS5umhKxHhm4xB6b91km6UYo+tU+Ttylt9SMYZsxWVj8jDnHSqb1V/OI7
 8jpgr4L2/KpSzh7OYlxbhows8ZWCgRNvgSnMZPNX6SW4T2Ry3CN/qS4lcMynpKG9Iwdn
 IzO6St5zJrBvV6Q3LmLL4d0mHZNBxxZlyqCWuC1xmHvMOpg77H929XQuAlQtaA9K7F2M
 9C8A==
X-Gm-Message-State: AFqh2kqgG+PBwtyIgnkIIwkgarbpxEVSgRtNxQnrtM1LYXzXjWSTX1M9
 MuJr5aKkczatoS5xlNcoh7PLBg==
X-Google-Smtp-Source: AMrXdXsriPBC/u2WzPrwGYBCsosA0BsYTypVYoyxIusZ78gIkGgTQzrVWOsu/jmesepNcjchR4QWeQ==
X-Received: by 2002:a17:907:6f18:b0:7c1:98d:a8a3 with SMTP id
 sy24-20020a1709076f1800b007c1098da8a3mr5058276ejc.7.1674005527000; 
 Tue, 17 Jan 2023 17:32:07 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906311200b0084b89c66eb5sm13799464ejx.4.2023.01.17.17.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 17:32:06 -0800 (PST)
Message-ID: <40261e85-f501-7326-76b0-b19ca3aceae9@linaro.org>
Date: Wed, 18 Jan 2023 03:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, dianders@chromium.org
References: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: Drop the redundant fail
 label
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
Cc: marex@denx.de, vkoul@kernel.org, sean@poorly.run, vladimir.lypak@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/01/2023 03:10, Jiasheng Jiang wrote:
> Drop the redundant fail label and change the "goto fail" into "return ret"
> since they are the same.
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
> 
> v1 -> v2:
> 
> 1. No change of the error handling of the irq_of_parse_and_map.
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++----------------
>   1 file changed, 8 insertions(+), 16 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


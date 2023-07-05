Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F1B748E9D
	for <lists+freedreno@lfdr.de>; Wed,  5 Jul 2023 22:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CE910E3BC;
	Wed,  5 Jul 2023 20:11:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A824D10E3B5
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jul 2023 20:11:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso8014659e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jul 2023 13:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688587913; x=1691179913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lcVd66LGKDN5EYJvATzXLdn3h1LOEZrZslPujKR9gFU=;
 b=YXGZIJZ6nachVEuQzc/IZNo9zEXiYi+3qek3qmciqPadXYSqe6tdM6yFyIkxS4finp
 yToukamMSrKbSnNMEAQNsCT6gDDTZCMCzzSKsFMv94vgr3Cyfn8k1Nf3PpjfJFCsEFvz
 8gDs0uKyi6Y2zhJogLFuuIQUsq/0k2Hf5F4zCl0XMnA8cgXNwZCpSja16LGLXCkyohjv
 GCadnX8Ipim7DjQ1rh6aC/TfpA645DjlTEU+Lg61ilNuklhe9l+SF29RMvGTjlqVevou
 iSCHZ+2vLEWgEW+OhOG0maqMfG+e/eNVQCQb2v2K54ii/WmYrHKEaNZj8SlWyOcZfFLk
 mX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688587913; x=1691179913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lcVd66LGKDN5EYJvATzXLdn3h1LOEZrZslPujKR9gFU=;
 b=A/zsgwVF6Y4LPK4onO7IxJ7YQYzf1GNJBlxfDtpUdiMfOrxX5JjrnYViDThfq423ak
 B+qNxobhxzs+UzWjORjY4LRkz4sobqaND+VMFmNnNhDJLYFtPm9ZDB/Z2opu2i1nyloq
 DM2FDaIF0fjfYXfig4Ka2th/COhD4UwVDHciT2rc5jxKiAuoDezZUVMRDM+46E2ejhBZ
 3M2Ui1wQNT0/IsadyZcKFi9lG2H7RkmYyEWhCpJ4yGQ6M4WBrXHgZFsNHtNaz+/aUhpe
 bZSZDFRUCO73FENoSXZ1BacIOG/Doda9TK9EyRqZstrZa6+F8HZLrD3Goie59Im4SCHc
 kyVA==
X-Gm-Message-State: ABy/qLavhS2twLHy1BXulQfY5fjtLWenH+4/mXKlWRsAPCWB6DW+hkAG
 7Si8rWp3uS6a2cNkCl5xyI7t6A==
X-Google-Smtp-Source: APBJJlGOWtuaZF1gcaIcgphg/Ji6Uk1NoTGrqR5CoDcm174dMUUXiOcCMmFdYb2CR95t/vfYN5Mdew==
X-Received: by 2002:ac2:4bd4:0:b0:4fb:99f7:da35 with SMTP id
 o20-20020ac24bd4000000b004fb99f7da35mr65182lfq.15.1688587912764; 
 Wed, 05 Jul 2023 13:11:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a19f70e000000b004fa35167729sm5488873lfe.159.2023.07.05.13.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 13:11:52 -0700 (PDT)
Message-ID: <26c7e593-7635-e96c-c21f-5fd2e5285281@linaro.org>
Date: Wed, 5 Jul 2023 23:11:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
 <20230622-devcoredump_patch-v2-4-9e90a87d393f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v2-4-9e90a87d393f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 4/5] drm/msm/dpu: Remove redundant
 prefix/suffix in name of sub-blocks
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/07/2023 22:30, Ryan McCann wrote:
> For a device core dump, the registers of sub-blocks are printed under a
> title formatted as <mainBlkName_sblkName>. For example, the csc sub-block
> for an SSPP main block "sspp_0" would be printed "sspp_0_sspp_csc0". The
> title is clearly redundant due to the duplicate "sspp" and "0" that exist
> in both the mainBlkName and sblkName. To eliminate this redundancy, remove
> the secondary "sspp" and "0" that exist in the sub-block name by
> elimanting the "sspp_" prefix and the concatenation of "num" that results
> in the redundant "0" suffix. Remove num parameter altogether from relevant
> macros as a consequence of it no longer being used.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 50 +++++++++++++-------------
>   1 file changed, 25 insertions(+), 25 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


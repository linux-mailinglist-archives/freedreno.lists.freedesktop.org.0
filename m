Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC15381BAD
	for <lists+freedreno@lfdr.de>; Sun, 16 May 2021 01:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DEA6E454;
	Sat, 15 May 2021 23:04:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4449A6E0E5
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 23:04:50 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id w4so2762872ljw.9
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 16:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OIu8Q4sgkPhmvMjd1jdK3ceBv8MZIPFNfCveUuP/nXw=;
 b=ZAmyTQq+43IOcBhnWLVn47XdIoRwtk0gVIMI4rFsN3bPiDWhZi0EVmlO7HSPttROXs
 joJR8PNw5g5dkNHzx2vN4FneuEVxYh7/iFDB1j3VopR9p24h8Jy1blZvywqoYSl9NHwU
 gWL3deAvHtyMYomPNwfz0xLqIH40y4fNN5p7A05xbwpIuwkCRuJKtFpq7pGP503PGrlI
 ECG2Nzv2DNjX3F5P7om8WxfpqA6P5wwlb2AOWbkFeN2S9k1J1y2GO9MtvY1d16YROogM
 5iqsSS8NXp2ZwJllBvWrOJ4seW9iV7k6J+wos+KWRkP/qbBNsYZEnLsum6Pm3/VNDood
 Gxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OIu8Q4sgkPhmvMjd1jdK3ceBv8MZIPFNfCveUuP/nXw=;
 b=WSZDM1byJuREHihO+KToDNXUPRKXymyNDAWhwT5VYKBQWYZ3IP0FDXmtYrTfY6tYnJ
 fX8HlrhwUQxp9drlP0B/wHFIDBXYwcknmMUfhDQdzL5GIhHiQ+mR1oslpLixN3YgFznc
 gUzrG2rVjoW2O6w9NybKm6iS6eTYqwVMjDPQiOptWZi5s+ZgOvGxqgCU78SxP9UCG1xy
 j0Kagso64Uh84wDnGe2e1V9mruzIQN71ADeWmELuNp4LXXxTlX9wrUmvJuUg9JE2YKP+
 7dpNOW77HmrH1F7zQIobb1r1vHNpLl1YnAyxfzKV8NTbQKSlkbaE5DvfYbe/DVzp5rUJ
 BvDA==
X-Gm-Message-State: AOAM533H73gr+2TTcf6Q4wjDeopQA25xP9AHf41e6ihDXn7kO5nOooaU
 tGrhKrgDqQNb0yMK9BcgaZvYMg==
X-Google-Smtp-Source: ABdhPJy1quJvaV/nck7SUQ5ex6Rk/kzi1csbr7LsYS9BiSb09QbHjGoll6VpORSW9HvLGlmtZIisWg==
X-Received: by 2002:a2e:8708:: with SMTP id m8mr8691010lji.383.1621119888679; 
 Sat, 15 May 2021 16:04:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q19sm1472998lfu.105.2021.05.15.16.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 16:04:48 -0700 (PDT)
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 linux-arm-msm@vger.kernel.org
References: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ca8dbaa3-a510-d75c-e1cc-c4b964c90e5b@linaro.org>
Date: Sun, 16 May 2021 02:04:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH v2 0/7] Qualcomm DRM DPU fixes
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
Cc: freedreno@lists.freedesktop.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, martin.botka@somainline.org,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Angelo,

On 12/01/2021 22:26, AngeloGioacchino Del Regno wrote:
> This patch series brings some fixes to the Qualcomm DPU driver, aim is
> to get it prepared for "legacy" SoCs (like MSM8998, SDM630/660) and to
> finally get command-mode displays working on this driver.
> 
> The series was tested against MSM8998 (the commit that introduces it to
> the hw-catalog is not included in this series, as it needs to be cleaned
> up a little more) and specifically on:

Any updates on submitting hw catalog patches? If they are not yet fully 
ready, could you please send an RFC or DRAFT patch for the reference?

> - Sony Xperia XZ Premium (MSM8998), 4K dual-dsi LCD display, command-mode
> - F(x)Tec Pro1 (MSM8998), single-dsi OLED display, video-mode
> 
> ... And it obviously worked just perfect!
> 
> Changes in v2:
> - Dropped patches "drm/msm/dpu: Add a function to retrieve the current CTL status"
>    and "drm/msm/dpu: Fix timeout issues on command mode panels" as the
>    second patch was wrong.
> - Fixed patch apply issues on latest linux-next and 5.11-rcX
> 
> AngeloGioacchino Del Regno (7):
>    drm/msm/dpu: Fix VBIF_XINL_QOS_LVL_REMAP_000 register offset
>    drm/msm/dpu: Move DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks
>    drm/msm/dpu: Add prog_fetch_lines_worst_case to INTF_BLK macro
>    drm/msm/dpu: Allow specifying features and sblk in DSPP_BLK macro
>    drm/msm/dpu: Disable autorefresh in command mode
>    drm/msm/dpu: Correctly configure vsync tearcheck for command mode
>    drm/msm/dpu: Remove unused call in wait_for_commit_done
> 
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 90 +++++++++++++++----
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 49 +++++-----
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 26 ++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |  9 +-
>   5 files changed, 147 insertions(+), 41 deletions(-)
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

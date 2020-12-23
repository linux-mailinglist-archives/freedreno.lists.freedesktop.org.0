Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D792E1E30
	for <lists+freedreno@lfdr.de>; Wed, 23 Dec 2020 16:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF296E0AA;
	Wed, 23 Dec 2020 15:38:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111F66E0C2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Dec 2020 15:38:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id r4so6493063wmh.5
 for <freedreno@lists.freedesktop.org>; Wed, 23 Dec 2020 07:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FLK03MoPTeVjiiFwNtS1OJi+2ld8fgev60+sqAPXpLo=;
 b=aC3XOqzY6SoQTeia6KLuOxot8sYnDpr+WcX5Gf8TnqSRzAGywSgSslZ3koDvjM6ib3
 Pdi8mTDstbmvSu74oQEOtEGOcaGapMdnt2guYjiyiuNyI9a0TublPIgvHTytVaRBjlZT
 P6j/dMWOfY+mTZFcmLTsQreejEnkaqN7T3glvlvOKrKRJBytjK48P5nyy1ekeQIxEJAB
 gda50nuPKtQTzYWtUjJf88582ql+s/mzHL29B5zze3o1y6CijcBcwgJuKKQ8+HjIiYYF
 PGpvC72eJLuyXVCZV+q1RrmtxpKoco3/pXOVOVNIk2k/ntzBIAeEEqbwtGUoGa90XnNF
 ZrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FLK03MoPTeVjiiFwNtS1OJi+2ld8fgev60+sqAPXpLo=;
 b=N3WLHAf5XCte+IdeeAu1FRWnTp3KtQ3smVoiMMZ9Lb6Kp3Hilh3fBqFot7EkuE22+w
 zKaW5SYLZPlaIeJS9zCaCL4ypJUZId42p5zMUMvwr/Vvbr0LKHrVgwyWtq9JCbuZZm+Z
 tHUWsi/88Pw0CGKxOTJg3wbRvk+FmIT3jZE8OClu6BVX+MnICpf8CYK0wqya+V1resfS
 4Bb7zVpfB88X2xZ07YuzBIHO53ueOErVawIfjYmU5z8RW5Xe2U3j9qZXU4V5jY98hNpo
 lI2kNawhhFBwods5VZi8vCdmaLWp8btt3ipYLBMXbhGsUcCHlSeZ1cxXHJgf3XVpXA4n
 w8/w==
X-Gm-Message-State: AOAM533leWS7t3K2csj6mgY/KyYzjOuBX645WHF3PNpacxDSnq1+jbJp
 oH7A5KbHxAHH6p/szwu3pi/98g==
X-Google-Smtp-Source: ABdhPJytXmL1Uj/jup8IDzFLZKwpMK6mZxS/1lbVrDQSOq3KCd2Df1ttM6R0Ksfu/w1e0jCslBiSlA==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr301307wmi.128.1608737901527; 
 Wed, 23 Dec 2020 07:38:21 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.64.13])
 by smtp.googlemail.com with ESMTPSA id y11sm212109wmi.0.2020.12.23.07.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 07:38:20 -0800 (PST)
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-2-git-send-email-isaacm@codeaurora.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <65b5382c-c7a9-0f18-96da-fe49e92e3b00@linaro.org>
Date: Wed, 23 Dec 2020 17:38:19 +0200
MIME-Version: 1.0
In-Reply-To: <1608597876-32367-2-git-send-email-isaacm@codeaurora.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v2 1/7] iommu/io-pgtable: Introduce dynamic
 io-pgtable fmt registration
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
Cc: will@kernel.org, pdaly@codeaurora.org, kernel-team@android.com,
 joro@8bytes.org, robin.murphy@arm.com, pratikp@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Isaac,

On 22.12.20 2:44, Isaac J. Manjarres wrote:
> The io-pgtable code constructs an array of init functions for each
> page table format at compile time. This is not ideal, as this
> increases the footprint of the io-pgtable code, as well as prevents
> io-pgtable formats from being built as kernel modules.
> 
> In preparation for modularizing the io-pgtable formats, switch to a
> dynamic registration scheme, where each io-pgtable format can register
> their init functions with the io-pgtable code at boot or module
> insertion time.
> 
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> ---
>   drivers/iommu/io-pgtable-arm-v7s.c | 34 +++++++++++++-
>   drivers/iommu/io-pgtable-arm.c     | 90 ++++++++++++++++++++++++++----------
>   drivers/iommu/io-pgtable.c         | 94 ++++++++++++++++++++++++++++++++------
>   include/linux/io-pgtable.h         | 51 +++++++++++++--------
>   4 files changed, 209 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 1d92ac9..89aad2f 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -28,6 +28,7 @@
[..]
> +static int __init arm_lpae_init(void)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(io_pgtable_arm_lpae_init_fns); i++) {
> +		ret = io_pgtable_ops_register(&io_pgtable_arm_lpae_init_fns[i]);
> +		if (ret < 0) {
> +			pr_err("Failed to register ARM LPAE fmt: %d\n");

I guess we want to print the format here?

Thanks,
Georgi
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

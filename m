Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BE26D6F1F
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 23:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB6A10E2F3;
	Tue,  4 Apr 2023 21:42:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17F910E223
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 21:42:40 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x17so44159598lfu.5
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 14:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680644559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0VVpMIHPposd8dIJG6VpkrFLF/OZQKsBp3Ngoym3OkM=;
 b=osZPRmogYcWFisUbGIWdvL2Ec7DMcZkqeOwefd0lTq2nzZwhsgkiOPh2qXwqttDHZk
 iXI5lg8Shj4zBjIFPzw3M0bizo7S1nMgSUD84WJYFTsTA3xmvOUPI7m3VbvQcNdGEV7I
 M4pajIm+IjPNazvWWrch6c/5Bbs906dZzVE7V9PNokcgA8evutlhAcFjtKoXKe+iM0Zd
 GFtxcmSdsGyPQjhycgEQCncTIohu+p4zIv6iXCDRKKV6rPDwgCMM6+UzxPWsZ7xKyizf
 QYBk35lGRzjpQ1nNKhxtCGl7PbnT438+1FDo2IoV28u6QRumqA3Lg95gLewLqoYglrXh
 IEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680644559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0VVpMIHPposd8dIJG6VpkrFLF/OZQKsBp3Ngoym3OkM=;
 b=W8EZZUPF3UvA5ovUaoW8SqDJec3lNDaJk8dDdWgM4Cz+7rWvJ4L7MKjT/5f7CV/sEG
 KGsmMhxvzV0RgyRwZtzxGtkQLadhwK9r2WXnJ/BXkvJJZGpdr70IjpLbiZL1Q06SFRTW
 5572rhkfcAq0N5q1Me6y0VbgAwg0RmYlq/ADcDlNEzpUWttt5QVYunYb6eTL5sqFDHT2
 BeoRCz/6gRnpW9Ja/P4Nxyjs1wB5Ym9v4vnnnp4NZirI+Eax/JNwWRYdYGh4DW1uShBg
 kScPebL25iOOT/Zcb+zB/QVAhlYdHrwaz6o9iGH5nfeihqawiFqS8+zDKOshfusvAIzO
 e/VQ==
X-Gm-Message-State: AAQBX9cSCTihvoRVlVP0pnrI4+jv/XEo9fb2UKBHgqLmwiExLAt/M6Hr
 ehzRH+baKXzRtctLmF3MRIYTfg==
X-Google-Smtp-Source: AKy350bzAO2ComF8Aki8azB3/UcsofxEuobFYAUPtjFGZXrBrLsP9eqeIPqHFdL0GmkTsrlWMt1pFw==
X-Received: by 2002:ac2:511c:0:b0:4cb:e53:d54b with SMTP id
 q28-20020ac2511c000000b004cb0e53d54bmr1145272lfb.25.1680644558636; 
 Tue, 04 Apr 2023 14:42:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004e8497a5604sm2501028lfh.108.2023.04.04.14.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 14:42:38 -0700 (PDT)
Message-ID: <db7e4dbc-c55b-c9b2-0cf6-bfacde56624a@linaro.org>
Date: Wed, 5 Apr 2023 00:42:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-2-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/8] drm/msm: Include <linux/io.h>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/04/2023 15:45, Thomas Zimmermann wrote:
> Include <linux/io.h> to get the declaration of devm_ioremap() on
> sparc64. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303301856.zSmpwZjj-lkp@intel.com/
> ---
>   drivers/gpu/drm/msm/msm_io_utils.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


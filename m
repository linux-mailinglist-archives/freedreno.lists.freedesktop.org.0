Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443F87C8590
	for <lists+freedreno@lfdr.de>; Fri, 13 Oct 2023 14:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F176110E5F0;
	Fri, 13 Oct 2023 12:20:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601C610E5F0
 for <freedreno@lists.freedesktop.org>; Fri, 13 Oct 2023 12:20:53 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50481a0eee7so3805255e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 13 Oct 2023 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697199651; x=1697804451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=scKE2AsXVylNf1Oa0+21s+niEDX4QrR948iXnuohg8k=;
 b=Fc49KJgZCGUKcyve2wgWKR1wXuZG6jO1gM0uAfB/zX+Kl5hWqq512xQ9qUH9/yKndb
 o+Udg6jtwl8d8Ao8e630mlNGMkjrgA7jLUWhTicsx23BXdpjfoZvubAVfW2lsImbTNkh
 8HwjSwRMCrwPzecx/50TvUYJObc9qFpu6y/E+ZRl2pw5r63s4hwQ/8HHqlcyrS8dZAO7
 PrCf6p5r68JfCLsIYEKD7BH5h9ewCnVNlqrpfW+eWmyU034OqvmI0xz4mRgbh36a2K1G
 ADz3MKJCD1eHBVR9ctT045vrcvNHDir3lEVkqIFsKH1le7K22B4luQ8hWPM2I3+/9ei7
 iCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697199651; x=1697804451;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=scKE2AsXVylNf1Oa0+21s+niEDX4QrR948iXnuohg8k=;
 b=V2IFgWE7NsaGgQJy8KMs/R+/seNfnEF+H7tMp5tbNbtAc+MSem4wppC88N2yKTU2XM
 np8qpUEjtZzJif9lstbI2wVA8z0XM1HRz0gGYag+sQ19OcG5nBJ5GAg8thgh/tE5V7hd
 htRlNGBKxES8/tf41qFr+GjGokmM8p33EvM6RbPniWqxJKKSYPnNdhrgfQ0DVzshZbZj
 pgZ5EhNFgmbZZx0bLGs7iRPNMKBcCCBPrpx/KEy5jCeISA9v1tDFDjhEpZFPM41HrBqX
 yIRsvMBD7yz5+tBtoxgpMeySJ2S1uqYhQQv932pbtkWiId2Is0r2LpvCNo5s5R/Rd9TT
 TLcQ==
X-Gm-Message-State: AOJu0YwIoaB19uBYWJpuvfWCrcUqXKknMflqF1gB6O8Yz76aF0Y1Jzju
 Jl5NjcyPGd8EkWNAgxaksEiZwQXzZxe4WKqAO9w=
X-Google-Smtp-Source: AGHT+IGi98bLs5nVM+QdnF38hQByCGGiYgXMYjRmxi6NZTOn1JFvjU0gMpfXGHUnveySsc95lW3nQg==
X-Received: by 2002:a19:641c:0:b0:503:7f6:ac20 with SMTP id
 y28-20020a19641c000000b0050307f6ac20mr18311483lfb.5.1697199651508; 
 Fri, 13 Oct 2023 05:20:51 -0700 (PDT)
Received: from [172.30.204.142] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 u4-20020ac243c4000000b0050089b26ea1sm3313860lfl.276.2023.10.13.05.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 05:20:51 -0700 (PDT)
Message-ID: <4f41fc79-b5d9-48f2-9895-38f474b1860d@linaro.org>
Date: Fri, 13 Oct 2023 14:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <de03d47f-27e5-412f-aac0-42d95f6a5501@moroto.mountain>
 <5170f4f9-d414-4b53-976d-5df2cb8b8314@linaro.org>
 <f19a598c-7e22-4399-bb14-a2e757ec498c@kadam.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <f19a598c-7e22-4399-bb14-a2e757ec498c@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [bug report] drm/msm/a6xx: Send ACD state to QMP at
 GMU resume
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 10/13/23 08:57, Dan Carpenter wrote:
> On Thu, Oct 12, 2023 at 06:33:20PM +0200, Konrad Dybcio wrote:
>> @@ -1810,8 +1816,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct
>> device_node *node)
>>
>>   	return 0;
>>
>> -	if (!IS_ERR_OR_NULL(gmu->qmp))
>> -		qmp_put(gmu->qmp);
>> +remove_device_link:
>> +	device_link_del(link);
>>
> 
> This patch looks good to me but there is something happening here which
> I don't understand.  This is not related to you patch, but where does
> the device_link_del() happen in the remove() function?
Well, you might have discovered another funny issue with the Adreno driver..

Cleaning up after the GPU failure was always an issue, that is HOPEFULLY 
solved today, but perhaps nobody had ever imagined to test rmmod..

I'll take a deeper look later to check if it's not hidden in some API

Konrad

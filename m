Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F577F5DEA
	for <lists+freedreno@lfdr.de>; Thu, 23 Nov 2023 12:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0BC10E71E;
	Thu, 23 Nov 2023 11:37:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8303A10E008
 for <freedreno@lists.freedesktop.org>; Thu, 23 Nov 2023 11:37:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50aabfa1b75so989974e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Nov 2023 03:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739457; x=1701344257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nm0hbEIAX6bA2MYwiGpkCXzOiz2e3i3AxzXDyzNcE4Q=;
 b=BXNeSYyJYbosjI0lnPzUYw58D0hTukHZDUMkF/oRmfRjOJWq9AYFoSSt2pEreWXpM3
 LSk/BEIhWVr6B/RMbELBxtqhGNrFir++ktlXSHazXCrdFU5rfbMvf1+LKYWM3DYzOKNE
 BRHx5G6b7EwO6+msNJhjCl+EMKDOTDWzmPHJJuFr2uwgm4SGbSXCbRK9RTTd6Z0+EAbX
 biHzfJreik3UmhVHnPdQ5jGvTEYlcdnD7FaWYpwIFx0MdIs6Z/Ikvwta4v7OWoHLz6CB
 arQKP60VLQNh78Syj0DaGfuwA0XR/VENUAWmhSfUdCG09V9mJi08rXlfAv9OTo3E0oxF
 s35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739457; x=1701344257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nm0hbEIAX6bA2MYwiGpkCXzOiz2e3i3AxzXDyzNcE4Q=;
 b=n5YUGBWZ/+3gfFRx6h9jnrUSqcX3x8KJzbwSrjSIsRgoUMfkVTRo1AqeFdxwstqAMv
 zS8KxvaT1D/pM2LkWPYubRiC7buG6IaJwXPsV7+1NDiRkkgF3cSo8MyxP6ThciGlIgev
 PuWgXhLPr4lStvrUBMlasOPKwiu3yyfYCP1BWq/qnxmo/e6EwFBHARTjZxShAm515RAm
 O6Wd5efMPGwikGDGXjrgdUigLB1+5oLEE0TbFOTaUsXmW00vK4IUJArW025GnDB+1Des
 6ZeYUgGlvXNUh93FxgQqHl5GvCoiVQvLQeADk6RYDvosE16nfX+LtoWFbP7MtB9zqv/i
 9T3w==
X-Gm-Message-State: AOJu0YzYJnSz1eBNgauSh1lOG7pooPTi2GsvAu4tLiw8HbKivgE1ibNH
 guIO5ElprG0kfYY4y4KvsX32wQ==
X-Google-Smtp-Source: AGHT+IGVn/cRKB4SR5kspsiZK5lcGwtL1/UJAwGrszDITZYjaYkgwg7kZEfFdYmBBnxpyjbBVu+e8A==
X-Received: by 2002:ac2:43a5:0:b0:500:daec:2817 with SMTP id
 t5-20020ac243a5000000b00500daec2817mr3796344lfl.54.1700739457263; 
 Thu, 23 Nov 2023 03:37:37 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 x15-20020a056512078f00b00507a96d17b3sm167232lfr.237.2023.11.23.03.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:37:36 -0800 (PST)
Message-ID: <70836806-5228-4b32-be97-f00a476bbe47@linaro.org>
Date: Thu, 23 Nov 2023 12:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kunwu Chan <chentao@kylinos.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 jordan@cosmicpenguin.net
References: <20231123033329.27477-1-chentao@kylinos.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231123033329.27477-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/gpu: Fix null-pointer dereference
 in zap_shader_load_mdt
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunwu.chan@hotmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 11/23/23 04:33, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> Fixes: a9e2559c931d ("drm/msm/gpu: Move zap shader loading to adreno")
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

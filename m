Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5386AA829E9
	for <lists+freedreno@lfdr.de>; Wed,  9 Apr 2025 17:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD9810E94A;
	Wed,  9 Apr 2025 15:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="krUamE4f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 358 seconds by postgrey-1.36 at gabe;
 Wed, 09 Apr 2025 15:19:50 UTC
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E66310E1B2
 for <freedreno@lists.freedesktop.org>; Wed,  9 Apr 2025 15:19:47 +0000 (UTC)
Message-ID: <f3c32f5c-4645-4cf5-8799-f44c947f59b4@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1744211629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hkq0kWeJyFGk/QsFEX35TlfroTF2TbB89iLI6SlYXVk=;
 b=krUamE4f0ARAVngmHDHfVgMNUWgcjFH34XbI2XrpDi6C5v+AxQXGXZ36NS0q9BBkhKwepc
 YrphXnUk5R96aCwLZbfqiNmBxkhCfstrq6N6EdJg1vJ8W9r0LBUc8YvfBTAjB5alPht9R2
 vHKP7te+ekAeeblzfGegcgGQrz690lB4olmt6IeEQTnoLM3V4FN5RVNzD6pR8NubOF8B8+
 hwW/OxZM6qqzcKHJTzitaAZo2qTencqx8oJoenQmpbanpF1imPyhSZV9LrdH9d3Mr3qSfE
 eh8aK7CgRyO3hjPXPPBhxb3+gm2aoh4wC6vzkzxvlJ54yLwlfZLYnnKNlcmUUg==
Date: Wed, 9 Apr 2025 18:13:39 +0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] drm/msm/a5xx: Get HBB dynamically, if available
To: freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-2-94d505cd5593@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <20250409-topic-smem_dramc-v1-2-94d505cd5593@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 4/9/25 17:47, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Highest Bank address Bit value can change based on memory type used.
> 
> Attempt to retrieve it dynamically, and fall back to a reasonable
> default (the one used prior to this change) on error.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 

Hi!

In the previous patch 1/4 you've said:

 > modern Qualcomm platforms (>= SM8150) expose information about
 > the DDR memory present on the system via SMEM.

If these changes affect only newer platforms, then I do not understand
how a5xx would be affected. Or do dozen of older platforms (that are
using Adreno 5xx) also expose that information?

--
Regards,
Alexey Minnekhanov

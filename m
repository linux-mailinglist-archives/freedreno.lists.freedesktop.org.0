Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31510859711
	for <lists+freedreno@lfdr.de>; Sun, 18 Feb 2024 14:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7136410E137;
	Sun, 18 Feb 2024 13:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=lausen.nl header.i=@lausen.nl header.b="iy5TpIw8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACDE10E137
 for <freedreno@lists.freedesktop.org>; Sun, 18 Feb 2024 13:13:02 +0000 (UTC)
Received: (qmail 22200 invoked by uid 990); 18 Feb 2024 13:13:00 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Sun, 18 Feb 2024 14:13:00 +0100
Message-ID: <3639aa97-5681-4704-ac91-388d751dbc72@lausen.nl>
Date: Sun, 18 Feb 2024 08:12:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] sc7180-trogdor-lazor image corruption regression for
 USB-C DP Alt Mode ([PATCH 0/2] Add param for the highest bank bit)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, freedreno@lists.freedesktop.org,
 regressions@lists.linux.dev
References: <20231207213048.1377147-1-cwabbott0@gmail.com>
 <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
 <cf95947d-8bec-4f95-9e08-2d942723cafc@linaro.org>
Content-Language: en-US
From: Leonard Lausen <leonard@lausen.nl>
In-Reply-To: <cf95947d-8bec-4f95-9e08-2d942723cafc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.99991) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.08991
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from; bh=yaFLPSiI1CV3Pb147sgWxT4eZhlhqqyrt5YoLH9j6Ks=;
 b=iy5TpIw8mYhLEcX0yEzkuY7e9av3QXIiUK8NPZAvCoHkHRWGTHlV9rdvffjMs3DbbT66QSjwrQ
 w2rSyVMuZJFgKLKMlSUoNgUkqcZavs2UcOSkuAicsE7odnVbkbq1pNRZIiHcq2JeEb69m8Zah3HO
 Mht6NuZsw+cfId+zUe0f/Smn8NN+z1ZJlVKq31KRHR3lGupdG8D5PGGQyiVxi5sn23uzDxOomIDV
 aoXiSc3Kpzp0MxJw3QUKEvO2JWHkNnGqqXeT7+OlCyCtrhGgurmTTrddo8PYNFl/VEApQiqXfweg
 ZOK8uSSJvPDDaVD8koZjLd5WrU5PrwXxX5xn6aPaOn2UwxdbDxnFcOo84TetCMRrUODHSI4qgejU
 9zwtlpZUGVTHTvzRdfPtUtBmGgtHjTb7r7afxtUFk9AYkKpY1MH40hgB/S2dGvk0p5ADdiyUHZY4
 fUVqQhyKhoLFhszDiNMnR1SLdEpa7O44nemfGt5dPuVKxGvfEUHyH0wzP1oObfNApNy29mjEpV0h
 N3v7U4F5C3/QgPIX9D1l4C5OeDKOOzVclc8FfrssFOAzG/5lfHoI/3j+Vfyy8k++XvH2TFyh3QSr
 U3CURcMh/RGqjsJvbvcN5jBjSHxAMyIOCvirWKTMLCRwp71zThEWnVywki/bIUdltUwf8ZAHQLYE
 s=
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

Hi Dmitry,

thank you for sharing a patch. I tested and can confirm it fixes the issue.

Best regards
Leonard

On 2/17/24 23:04, Dmitry Baryshkov wrote:
> Hi Leonard,
> 
> On Sun, 18 Feb 2024 at 03:17, Leonard Lausen <leonard@lausen.nl> wrote:
>>
>> Hi Connor,
>>
>> unfortunately, your series https://patchwork.freedesktop.org/series/127529/ has introduced a regression for external displays connected through USB-C DP Alt Mode, at least on sc7180-trogdor-lazor devices. Do you think it's possible to  fix this before the 6.8 release or would it be better to revert the series? I'm happy to help testing any fixes. The issue is also tracked at https://gitlab.freedesktop.org/drm/msm/-/issues/49.
> 
> Please check whether this quick fix works for you
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c9c55e2ea584..f097577a99ad 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1325,6 +1325,11 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>      struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +
> +    /* a618 is using the hw default values */
> +    if (adreno_is_a618(adreno_gpu))
> +        return;
> +
>      /*
>       * We subtract 13 from the highest bank bit (13 is the minimum value
>       * allowed by hw) and write the lowest two bits of the remaining value
> 
> 

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7DC134A5E
	for <lists+freedreno@lfdr.de>; Wed,  8 Jan 2020 19:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815396E8B5;
	Wed,  8 Jan 2020 18:20:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75AA6E039
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jan 2020 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578497899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1eGeIWiwUf1mluye9R+kVxpOKPsNVjl3zOy6Wq1gu+k=;
 b=KiajyBY86Ok3HKvX9gNS7mTRK1zgYtFzhbOL8nLGWinxHqRAoFlfnp+UzVJZKVnRuz56JQ
 FXuQc1BIgcJsUQUTCLr26S0V8QRGv4boAsRrYsSDOOBI3uuqQeu7B+I+n9aVAZl6jHCK6u
 4u/rRbpIZuFDX5klp8xEBzDqPqHqruo=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-jzpKsDQ9P0aAFbXZjo2Zuw-1; Wed, 08 Jan 2020 10:38:16 -0500
Received: by mail-yb1-f199.google.com with SMTP id a5so2295203ybc.12
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2020 07:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1eGeIWiwUf1mluye9R+kVxpOKPsNVjl3zOy6Wq1gu+k=;
 b=dRWkKyv/61yhNP+pRyhcrAtCn98ywZh2r+aHlb+TDPmhucnQFUV7Tlr38ZxJM0gISi
 veDeA9Kwt5KGkrEUPT1baaOytRv5irV7F7fA5teVQBU8DGzMjtzjx7XvkkhaWs5pKkaY
 sOpmJ7QmHzjszGp/1zagP5K+eD0u0GuzPUFc2KAKpJrDwVzybP7AkrgNg2AIB1Z8uaxU
 TCKL7vgWXj+Or2cXYYgg15XwrgGEhyGTyMTlPIS3EYIqYlBovh/dzilQkAY6dsP3IQNw
 NPqFVsD3mJpNth5IXV0Y6A5ptAGuINtMBnM/unwlMMcOdlVsweh7USIPeXGGXaXrcWvz
 yZxw==
X-Gm-Message-State: APjAAAUwceCWWyAsgTkBid7sfGP26MOKFHb2d6ExD5UK8TY3M/FDOXh9
 vHiI6/XbbVDRDqdMmWEiZ/K3JEuv0nHcy7Pd7PiCgPl5ak60Lqep3j392mNIM1/+k2JzYovlTk9
 M0H3u0UoXzzxTSeXQzXrjlFAF9ZfM
X-Received: by 2002:a81:1b45:: with SMTP id b66mr3776944ywb.435.1578497895738; 
 Wed, 08 Jan 2020 07:38:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQZmJI4VQh+Cl1LLv1EgTRLeZDIIYl7gaRjBgl5k3h96bkDfJduVd+FgdSyHJqPABucCPzYg==
X-Received: by 2002:a81:1b45:: with SMTP id b66mr3776918ywb.435.1578497895426; 
 Wed, 08 Jan 2020 07:38:15 -0800 (PST)
Received: from trix.remote.csb ([75.142.250.213])
 by smtp.gmail.com with ESMTPSA id n8sm1583723ywh.75.2020.01.08.07.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 07:38:15 -0800 (PST)
To: Rob Clark <robdclark@gmail.com>
References: <20200108013847.899170-1-robdclark@gmail.com>
 <20200108013847.899170-2-robdclark@gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <37d0baaa-3f94-9414-88e7-7e849b0c5de5@redhat.com>
Date: Wed, 8 Jan 2020 07:38:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200108013847.899170-2-robdclark@gmail.com>
Content-Language: en-US
X-MC-Unique: jzpKsDQ9P0aAFbXZjo2Zuw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Wed, 08 Jan 2020 18:20:58 +0000
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm: support firmware-name for zap
 fw
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
Cc: Rob Clark <robdclark@chromium.org>, Fabio Estevam <festevam@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 1/7/20 5:38 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Since zap firmware can be device specific, allow for a firmware-name
> property in the zap node to specify which firmware to load, similarly to
> the scheme used for dsp/wifi/etc.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 32 ++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 112e8b8a261e..aa8737bd58db 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -26,6 +26,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  {
>  	struct device *dev = &gpu->pdev->dev;
>  	const struct firmware *fw;
> +	const char *signed_fwname = NULL;
>  	struct device_node *np, *mem_np;
>  	struct resource r;
>  	phys_addr_t mem_phys;
> @@ -58,8 +59,33 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  
>  	mem_phys = r.start;
>  
> -	/* Request the MDT file for the firmware */
> -	fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	/*
> +	 * Check for a firmware-name property.  This is the new scheme
> +	 * to handle firmware that may be signed with device specific
> +	 * keys, allowing us to have a different zap fw path for different
> +	 * devices.
> +	 *
> +	 * If the firmware-name property is found, we bypass the
> +	 * adreno_request_fw() mechanism, because we don't need to handle
> +	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
> +	 *
> +	 * If the firmware-name property is not found, for backwards
> +	 * compatibility we fall back to the fwname from the gpulist
> +	 * table.
> +	 */
> +	of_property_read_string_index(np, "firmware-name", 0, &signed_fwname);
> +	if (signed_fwname) {
> +		fwname = signed_fwname;
> +		ret = request_firmware_direct(&fw, signed_fwname, gpu->dev->dev);
> +		if (ret) {
> +			DRM_DEV_ERROR(dev, "could not load signed zap firmware: %d\n", ret);
Could adreno_request_fw be called with fwname if request_firmware_direct fails ?
> +			fw = ERR_PTR(ret);
> +		}
> +	} else {
> +		/* Request the MDT file for the firmware */
> +		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	}
> +
>  	if (IS_ERR(fw)) {
>  		DRM_DEV_ERROR(dev, "Unable to load %s\n", fwname);
>  		return PTR_ERR(fw);
> @@ -95,7 +121,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  	 * not.  But since we've already gotten through adreno_request_fw()
>  	 * we know which of the two cases it is:
>  	 */
> -	if (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY) {
> +	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
>  		ret = qcom_mdt_load(dev, fw, fwname, pasid,
>  				mem_region, mem_phys, mem_size, NULL);
>  	} else {

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

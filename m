Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6CA4B576
	for <lists+freedreno@lfdr.de>; Mon,  3 Mar 2025 00:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726CF10E10E;
	Sun,  2 Mar 2025 23:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XKUvJgrY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B051610E10E
 for <freedreno@lists.freedesktop.org>; Sun,  2 Mar 2025 23:01:44 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5495c63bdc0so1448030e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 02 Mar 2025 15:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740956503; x=1741561303; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+6tLHwT02MdyiarYGqAftjy+FZoaHm2RQy2amBFDQNM=;
 b=XKUvJgrY6IUMdgIGKtTPVyq394ojb70GWi1UjS+rbjQOIYKPOwnV2yNwHwSvlV5gAC
 ozl822VOsPl3coUnfEpeKA6I5dVA320HH08VJ3RJbg5+3j1ELZk6F2pGd2G5XeqIeQpX
 2ku6UpEC7TiPLNn5TFXHInVPxkPzYt/9wypmnWKnOAMAOEieAFOYsBdvuvkF3+lR3Knp
 ggzW4eU1OGVkLmSdkupiks1h4xrnmxGpHVkNxadLVzWU6OozRnEREB7Hm0a1F8KlS71V
 y2sZ5Zf9PheEilcAVul2N9ICfPXZQE1G5opCyeHpG0pka39WcYqoX8EeTUF6pkGobz+Y
 TGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740956503; x=1741561303;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6tLHwT02MdyiarYGqAftjy+FZoaHm2RQy2amBFDQNM=;
 b=uQLM4qbKMPxFBGtKKnDKDR/6Fu5vkgUkNyBxJQH7QDNsQ7B5yCH+HPWqG2VttHF6oQ
 wjEueUx4IF2pGCKcgjWWDS7nbFQHq9ZfU+j6BhTxEDJmRZpR7OTQb56wl0Yzili+0BVS
 36/z/pjsj2JaiGpUSJBck8E0Swk3MNjahQnI5VYtx2mKAsBXKzVxxw0elzy6WNw2N88R
 XLDaKRPUjfwuzcxpH+bv0SbV1zWy/QZX88TmbwpNuYya+1cwvkWsZu7usPuWGkxTwFVo
 HxeftYao+OaEZqfD8YF1vWo+Z3lqcnGg6Grw5PVuriRtxwDwiA0Ykz9ehKuRWjxDo8w9
 ZPTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN4A/F8nz3Vlz0rygTLAY2QOQ98081oXx/TLxYd92p6rLFe7zKHx7HReajAA3h656b+xPSHH9nkm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx6E82zTiEBSHmBcwWU2+JGP/lmOe8VQr/d1MIqEs0zccdfixg
 TuekL65H/M7Q5gmhaA07Fcgn1daLy5h/5ula0n0QWL43e+DKxhuI35nqoiM+MT4=
X-Gm-Gg: ASbGnctPn2BiEdOmwppmMQuAuuFmlhsV6/d4h3SoqWcJ4Faqouiu4AseMrRFkdbKBof
 TzXzo8MQ+WIf8bmmDSXclztof5TdyqjOw8KL5kP5f8z21+vT+p8SMtrM+2DdruKCOzzpuWggjUA
 6jDqXCNPVv4EpZX3SD2q/eU3lh6K/8FNByHLSU5x6KGUlKj3XGKb+vaAEArk/9EFZ5nbXOCGQOL
 a/uwfTvnEU+5vffWydlzKasPp0BqyZ+IvmeKwbdAlNrDqMoUI+4oUsmRXDXMMQD1+qJaVBAddMl
 t0sAVkCTBRqQ7cVxYbDVEwHQRGk32ZiZTUCwtshGtSHZ5vRTZ6oTXfQuMG21Ds6P0vRy06c0Fxa
 uDyZzq+BgLOYOIIsKlW0kXHwk
X-Google-Smtp-Source: AGHT+IE6iJ6MJULbhVODlhEs0Uz3Bo0Jahq2KVUfeiM0dMjeCLZC5DbHiJxY2q28Q7dzFsOZ3W5T5w==
X-Received: by 2002:a05:6512:3b11:b0:545:2f48:d524 with SMTP id
 2adb3069b0e04-5494c320d25mr3513353e87.29.1740956502909; 
 Sun, 02 Mar 2025 15:01:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54956a2c610sm747244e87.4.2025.03.02.15.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 15:01:41 -0800 (PST)
Date: Mon, 3 Mar 2025 01:01:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Delete a variable initialisation
 before a null pointer check in two functions
Message-ID: <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
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

On Sun, Mar 02, 2025 at 09:56:00PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 11 Apr 2023 18:24:24 +0200
> 
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> 
> Thus avoid the risk for undefined behaviour by removing extra
> initialisations for the variable “c” (also because it was already
> reassigned with the same value behind this pointer check).
> 
> This issue was detected by using the Coccinelle software.

Please don't send resends and/or new iterations in response to your
previous patchsets. Otherwise they have a pretty high chance to be
ignored by the maintainers. Use a fresh git-send-email command to send
new patchset.

> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 0fcad9760b6f..870ab3ebbc94 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -176,7 +176,7 @@ static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong *pp, bool enable)
>  static int dpu_hw_pp_connect_external_te(struct dpu_hw_pingpong *pp,
>  		bool enable_external_te)
>  {
> -	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +	struct dpu_hw_blk_reg_map *c;
>  	u32 cfg;
>  	int orig;
> 
> @@ -221,7 +221,7 @@ static int dpu_hw_pp_get_vsync_info(struct dpu_hw_pingpong *pp,
> 
>  static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
>  {
> -	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +	struct dpu_hw_blk_reg_map *c;
>  	u32 height, init;
>  	u32 line = 0xFFFF;
> 
> --
> 2.40.0
> 

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1982EA1A15E
	for <lists+freedreno@lfdr.de>; Thu, 23 Jan 2025 11:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E5310E7A8;
	Thu, 23 Jan 2025 10:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="mst4vW/O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9298710E276
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 10:02:51 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso3498649a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1737626570; x=1738231370; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=drduYnk0T5L8Jc35PgLN0vz3hmxDA8Q9Aq+Acxd9EdM=;
 b=mst4vW/OuFc/XUfDT6FvnEamyb3qkVX2/r9C/bkTmGRK2Hf0lDJTI+P8hS4IUwtAjr
 noPGI0UoRaSsbznoym5vvQPHF8B6/pezOHOn3aYrUrrJbpoQb90lG45n0w1HLQYtAQEV
 xmn7YLMoZDYmOgQO6pEPm00jz9UpAuUhnkbaYyoD3SaLQvBc2MrP9czGZodSaRCuB2vK
 jz8Ms1OLlG2qqtJ0pNy0U4rMTj2KublpMcQoPTKpKNcowR4r/ZnjJCBUVU/NmjrdcO8l
 xbaXVyF4r5cgiFJiDVedvKJFy0P45fWMA7GjlDXetHYFKaM+JyuUZCf4ilZr59sJvx32
 rvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737626570; x=1738231370;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=drduYnk0T5L8Jc35PgLN0vz3hmxDA8Q9Aq+Acxd9EdM=;
 b=F9qqYeUYGtO5Qyf12jX+n3S+4ln28rzqLSTnBMxXsVabJ2J4sdIuB7tAjtNWjdvbuh
 QKJlaXD93h8dBOJlegaIMVYP8/80F2M7K7SUYYkAB0a1M4UoeOEdIjyW9SmBbeMWq1ux
 UDmvptwccbdjcGN723cz6elsUbD1rwVBBzdAv+uersHSsvpAZN/BzaafD8ISXpHFUBpe
 zzF946fYkSLyMnOkcsG6mK4Lt+uopOfPrlkBwt01JgFKrcbSvqzBVu+aeD+oxD/kWZNc
 MQx0L9RgKPk+gP+BT4QA57TLnIcluDkXynIj35bDBCcQ3V3P/XwPy7kx+mTdHHiL///N
 cGhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4JX5mOZ4K/HoBR/Gjb49Oj+ZHTSqRTpeLYd+F7c9k63zYlMaDECFTiP2o4CHNQlLjGZKBG4Ntet4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO6vYuleVYynvOS/RtoZln1UCPmaBfs41/HuOy+M+cfJ/nkIRb
 PxGNbwVO2pXm8YGHw4rMZbP4l8LzTPGwFwZLy/98m0b5Eq9xVhpr3+bQkklBDg8=
X-Gm-Gg: ASbGncukMIQZrpb0NaWC2xI0d+WkFJ77OQVoMD/b4TDrULO83Crr7uouJJClcO0qhl8
 fWvf9UuTTsaaACmdZO68i3c8nvuTQpvXU2e/4dOVbGWZKn2HjWNPbmQ0DD4L8nJXqjRhUMIoFxG
 jC4wRscbIwbdoXaJHA8EcBpkERxvRVnejWTF/csu8dCO1Ht2wvtbkMqU4IHbZkEe5r2C47B7iVP
 I5iKCxM948htstRDXUzr0d5xYL3kqPNTCNYZpxmYmLSTrEKuB75AFcF1aVEtuitgiPEdAAcHfeO
 qP6q2TfNMw6cVFRCA8cx0RTYetv8n12VYdoSyNIqOBXYtYZ1FQ==
X-Google-Smtp-Source: AGHT+IGgn/z8UEgmxBky4R5kvrAezpZh5INpY5PIVuOE485EV/eOT5oJ6tL0ZuiNbHU5X7XMdOI1rA==
X-Received: by 2002:a05:6402:350c:b0:5dc:13a6:b5f with SMTP id
 4fb4d7f45d1cf-5dc13a60e32mr6458a12.9.1737626569770; 
 Thu, 23 Jan 2025 02:02:49 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db8942cad4sm8565957a12.60.2025.01.23.02.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 02:02:49 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jan 2025 11:02:48 +0100
Message-Id: <D79D7LKK389P.2FJRN6Q9IZOBQ@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Martin Botka"
 <martin.botka@somainline.org>, "Jami Kettunen"
 <jami.kettunen@somainline.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Fall back to a single DSC encoder
 (1:1:1) on small SoCs
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Marijn Suijten" <marijn.suijten@somainline.org>, "Rob Clark"
 <robdclark@gmail.com>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Sean Paul" <sean@poorly.run>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
In-Reply-To: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
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

On Wed Jan 22, 2025 at 5:23 PM CET, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the Fairphone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the Fairphone 5.
>
> By loosening the hardcoded `num_dsc =3D 2` to fall back to `num_dsc =3D
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.

Still works fine, like v1!

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

>
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that this doesn't paint the full picture in case there are SoCs
> with more DSC hardware blocks, but when multiple virtual encoders
> have already allocated most of them.  My initial plan was to code
> ahead for dynamically tracking and reallocating these blocks in RM, if
> some virtual encoder could potentially be using too many DSC encoders
> which, while "power optimal", may not be able to support the number of
> requested displays/interfaces.  Such a solution would automatically
> ensure DSCmerge is *not* used when there are not enough hardware blocks
> available in the first place.
> ---
> Changes in v2:
> - Fairphone is one word, lowercase the P from phone (Luca);
> - Skip unnecessary if (dpu_enc->dsc) check and always count the number
>   of non-NULL dpu_enc->hw_dsc[i] instead (Dmitry);
> - Revert irrelevant whitespace cleanup in DSC comment, even if
>   worthless enough to send separately (Dmitry);
> - Drop dsc_common_mode=3D0 initialization and move existing 0-assignment
>   from a random place in the function down to where this variable is
>   actually being updated (Dmitry);
> - Link to v1: https://lore.kernel.org/r/20250121-dpu-111-topology-v1-1-d0=
1987205c53@somainline.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------=
------
>  1 file changed, 25 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_encoder.c
> index 5172ab4dea995a154cd88d05c3842d7425fc34ce..b585cd17462345f94bcc2ddd5=
7902cc7c312ae63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -622,9 +622,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *dr=
m_enc)
>  		if (dpu_enc->phys_encs[i])
>  			intf_count++;
> =20
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> -	if (dpu_enc->dsc)
> -		num_dsc =3D 2;
> +	for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++)
> +		if (dpu_enc->hw_dsc[i])
> +			num_dsc++;
> =20
>  	return (num_dsc > 0) && (num_dsc > intf_count);
>  }
> @@ -686,13 +686,19 @@ static struct msm_display_topology dpu_encoder_get_=
topology(
> =20
>  	if (dsc) {
>  		/*
> -		 * In case of Display Stream Compression (DSC), we would use
> -		 * 2 DSC encoders, 2 layer mixers and 1 interface
> -		 * this is power optimal and can drive up to (including) 4k
> -		 * screens
> +		 * Use 2 DSC encoders and 2 layer mixers per single interface
> +		 * when Display Stream Compression (DSC) is enabled,
> +		 * and when enough DSC blocks are available.
> +		 * This is power-optimal and can drive up to (including) 4k
> +		 * screens.
>  		 */
> -		topology.num_dsc =3D 2;
> -		topology.num_lm =3D 2;
> +		if (dpu_kms->catalog->dsc_count >=3D 2) {
> +			topology.num_dsc =3D 2;
> +			topology.num_lm =3D 2;
> +		} else {
> +			topology.num_dsc =3D 1;
> +			topology.num_lm =3D 1;
> +		}
>  		topology.num_intf =3D 1;
>  	}
> =20
> @@ -2020,7 +2026,6 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_=
ctl *ctl,
>  static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  				 struct drm_dsc_config *dsc)
>  {
> -	/* coding only for 2LM, 2enc, 1 dsc config */
>  	struct dpu_encoder_phys *enc_master =3D dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl =3D enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> @@ -2030,22 +2035,24 @@ static void dpu_encoder_prep_dsc(struct dpu_encod=
er_virt *dpu_enc,
>  	int dsc_common_mode;
>  	int pic_width;
>  	u32 initial_lines;
> +	int num_dsc =3D 0;
>  	int i;
> =20
>  	for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++) {
>  		hw_pp[i] =3D dpu_enc->hw_pp[i];
>  		hw_dsc[i] =3D dpu_enc->hw_dsc[i];
> =20
> -		if (!hw_pp[i] || !hw_dsc[i]) {
> -			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> -			return;
> -		}
> +		if (!hw_pp[i] || !hw_dsc[i])
> +			break;
> +
> +		num_dsc++;
>  	}
> =20
> -	dsc_common_mode =3D 0;
>  	pic_width =3D dsc->pic_width;
> =20
> -	dsc_common_mode =3D DSC_MODE_SPLIT_PANEL;
> +	dsc_common_mode =3D 0;
> +	if (num_dsc > 1)
> +		dsc_common_mode |=3D DSC_MODE_SPLIT_PANEL;
>  	if (dpu_encoder_use_dsc_merge(enc_master->parent))
>  		dsc_common_mode |=3D DSC_MODE_MULTIPLEX;
>  	if (enc_master->intf_mode =3D=3D INTF_MODE_VIDEO)
> @@ -2054,14 +2061,10 @@ static void dpu_encoder_prep_dsc(struct dpu_encod=
er_virt *dpu_enc,
>  	this_frame_slices =3D pic_width / dsc->slice_width;
>  	intf_ip_w =3D this_frame_slices * dsc->slice_width;
> =20
> -	/*
> -	 * dsc merge case: when using 2 encoders for the same stream,
> -	 * no. of slices need to be same on both the encoders.
> -	 */
> -	enc_ip_w =3D intf_ip_w / 2;
> +	enc_ip_w =3D intf_ip_w / num_dsc;
>  	initial_lines =3D dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
> =20
> -	for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i =3D 0; i < num_dsc; i++)
>  		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
>  					 dsc, dsc_common_mode, initial_lines);
>  }
>
> ---
> base-commit: 1573c8d4cb206a2d1454ff711e79f8df2353290b
> change-id: 20240204-dpu-111-topology-b12c1de82c8a
>
> Best regards,


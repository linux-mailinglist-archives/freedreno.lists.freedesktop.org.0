Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IvGkDwRQdmk4PQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 25 Jan 2026 18:16:52 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785FF818DF
	for <lists+freedreno@lfdr.de>; Sun, 25 Jan 2026 18:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6F910E0A4;
	Sun, 25 Jan 2026 17:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nKXpQYLB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEC610E16B
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jan 2026 17:16:48 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-34e825b0c42so309034a91.1
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jan 2026 09:16:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769361408; cv=none;
 d=google.com; s=arc-20240605;
 b=fxYhRq/okcHbOqb+TP0uXs64xwPDBMkBZvbTsnyvgvOey+2UkYsP/6oBg/cvYDx5vY
 C18N2hlCKQfnJPgjF8MZXPgUcvKudoB0N6tRLVy+rQnIpIENkLAzeJgUFkAwAxjMdj1w
 8dPWd2WaOJXoD3gdrWoXgD4438GOJDShGhZPXh+1ygZxLMSEQ6763hhLXSsrqTo1cFTj
 bV8kgko/9a5RYOONAteUmxDmtEf8G6UM+3nCnY9juzBBHPxB0Fj0wWS7I6I/qQtJtcXA
 OjZc5TU7UsxGq6Gtie93H9zPEBWn9Y2jsZcphn3MqvQntDTfKlwSL5kCL6LVhslmcoIk
 78YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=k8X9SwxtwKptigAeV0uEMOHmuEgza198fJUXdmHkMTE=;
 fh=yxuySM1/WFvRNbY2Pp7fuNil3MQ74s0uqnuPqqY1irY=;
 b=I/CwCPmz2ykALyXfQuBvEZIIQXZyWBW5xGhzXa4d1F28qBHtcZG4/Zh+1Z5DnRePO/
 6Mp8Ns/ZehcMGvyheVL8K2gjCfaSw2ghM9sBulPbh1taoWwToh0ZCrlBONYpUlgUNKZX
 Q5kBvK1QWH000R3xZKUI9UbZxKGmBn6kQsqE7ZwquW4hec5Wfthxss1GWjbwm40VLHyX
 e76UgE0ZUhwKsfZN2qjcysO2ORNnj0noyzk3oPDa1Z1nTN8vuL7ejGqhQoquPSuSxLFW
 qMb2hi8c1eag2jAuPrw3QsqnKz/qRyHhDCb6sMS9+qXaeKgk8cGtXCCJuoMTKIqB1MyI
 +bbQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769361408; x=1769966208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8X9SwxtwKptigAeV0uEMOHmuEgza198fJUXdmHkMTE=;
 b=nKXpQYLB7Ni1b67bnsVCqbij/AzLhr0ff1nhtHvnU9CWsVStKf0TgStoW5vZ9NSU3w
 lT1eDnqp5joPie2Brb+EtahHHFVOX03xyKwomVZCao9OgWbJoHh+BlvBSffhBQex3mKg
 OfVrR9TGvb2ehJxQ/PYjXSrF1TdUAcDwC50CjQ1FubEPWLcg40p0OE6Ro8lkYPjaBz8Q
 ghsNINJ4eubD4cy6XApflxLSjFkIpf7rl3XcVnUUkDDLZotlHkqfVCsF9TUeM2AFDyhT
 RIM1Lrv2WZXmZ6/7Zx13YRrfkxCEAljs4Wioi1pHu2CqM1vJLfGqifkoEMSVfQspiX70
 QqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769361408; x=1769966208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k8X9SwxtwKptigAeV0uEMOHmuEgza198fJUXdmHkMTE=;
 b=QmmWYYIcPfgJV4ohmoQsk9+0Oo131q1SNl4xRkhMCe+8x+12O9iCs+j1KIrTVZGsX/
 iyDkaXQ2IQAcdT2TBKFGaR1ThudxlCXz9+c77adTjNXETZh00CnJZP9umOU634lTc70J
 zn8Og0SZc3dTeK9pCP+mHPI/7UEVWNjBNIvTSS8vNJryMyrrccxdR3bxH4yieQc6paVy
 5jcpkM3r3rmCRJ2wMgtR8OkjitipmcAqOY/WsScJhg0Dj5A3sgcNWbRwaktcrZNDcjrL
 lJGfkuQETeJ+KZav1cbMY0Qt57XrDzqX++qOSoekR50coI1yxyqX4KvLrR2PqjYdHz9t
 qPmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+sWEJr5fmAEzsEimwLzW52DDJpBPB/Dmm++xkGnRm74msKjEJ5ZzlTaMdsL0cr3wel+QY9j3Yrxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgNI3Ejqh7oR5HefH5Yp2NSN3KppvoiMmn+9Z73DRnf/cWQUzL
 G5ywInMm3tYPSO97OfRdLYdRzOxnGg9JCHLmjyd2p4L96Hk0RTm3WmYBuwzoLfVdwGRidcVhUHd
 HYQ+Os/zA0Ye+5qL2UQV0EUBOmBehjK4=
X-Gm-Gg: AZuq6aJ1lIqYG/l3QZxHdZn4GLurLze94gnZa0GNA7ii79GRyH8GnvrV57qHiT5vbKz
 OYcqEvJqZqu5N7NHhJ6jvhkvc6/9wNAi5Tq63Hzmv26CIPTZhn/e9lv0lf3n52H1+seLAeMg9T8
 p1+mCBixdRorBCbi12XYetPZhUBJw+o7wScddSg//h3raj5W1p3BGILa75d3/o0+8S2rybplwwn
 9mA1HNLKt0YkJJrC9aJWqTtMPW3jJrNKytPnDZSTTX7j1JKD5ptXPB+LsBEgCcpZ9hU46w=
X-Received: by 2002:a17:90b:394a:b0:340:dd41:df7d with SMTP id
 98e67ed59e1d1-353c41625dbmr1417254a91.3.1769361408319; Sun, 25 Jan 2026
 09:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Sun, 25 Jan 2026 12:16:37 -0500
X-Gm-Features: AZwV_Qh6bCEQHtHjA5NyO7y-zT5kVNEbiRdlIWpRsBNsjtNaSF0FG6h2tF4V0UQ
Message-ID: <CACu1E7Gpzgg0WKT9EyFO+uJsGCVAcEUG1OkTdhXLpGThTrd=Ww@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 "Bryan O'Donoghue" <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-media@vger.kernel.org, Wangao Wang <wangao.wang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[cwabbott0@gmail.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cwabbott0@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 785FF818DF
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 6:37=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Currently the database stores macrotile_mode in the data. However it
> can be derived from the rest of the data: it should be used for UBWC
> encoding >=3D 3.0 except for several corner cases (SM8150 and SC8180X).

FWIW, there is a UBWC version 3.1 not currently reflected in the code
which adds the 8-channel macrotile mode. If we just added that and
made SM8150 and SC8180X be 3.1 then we could derive it from the
version.

Connor

>
> The ubwc_bank_spread field seems to be based on the impreside data we
> had for the MDSS and DPU programming. In some cases UBWC engine inside
> the display controller doesn't need to program it, although bank spread
> is to be enabled.
>
> Bank swizzle is also currently stored as is, but it is almost standard
> (banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
> being Lemans (it uses only bank 3).
>
> Add helpers returning values from the config for now. They will be
> rewritten later, in a separate series, but having the helper now
> simplifies refacroring the code later.
>
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.=
h
> index 5bdeca18d54d..f5d0e2341261 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const =
struct qcom_ubwc_cfg_data
>                  cfg->ubwc_dec_version =3D=3D UBWC_3_0);
>  }
>
> +static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_d=
ata *cfg)
> +{
> +       return cfg->macrotile_mode;
> +}
> +
> +static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data=
 *cfg)
> +{
> +       return cfg->ubwc_bank_spread;
> +}
> +
> +static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg=
)
> +{
> +       return cfg->ubwc_swizzle;
> +}
> +
>  #endif /* __QCOM_UBWC_H__ */
>
> --
> 2.47.3
>

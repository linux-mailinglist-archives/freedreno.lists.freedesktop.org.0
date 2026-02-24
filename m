Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJiYHhZSnWk2OgQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 08:24:06 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8FE182FB0
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 08:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBC810E4C5;
	Tue, 24 Feb 2026 07:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pr0aYSNt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EN59c3Hz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E68310E4C5
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 07:24:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O4Lakv2013367
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 07:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 75bYi11fyYiC46XW/yzaxaazSdDaY5pv28Q4r6DamKE=; b=pr0aYSNtF9VAdAMB
 ZIV+HgNAIbPvGd4tYTlks3ov7Xfys3dUfhFf7dps84i4jTtKkl9N3YOuXDqzieaG
 +AFMa4McAXPCNielYf/uvau9TQr2sW8jRfadXHMuyS71LR5NDU1Npq96a2iRelPU
 D/3/pFnGGs+TTbnuzVP8mNGrkXZVddO/ie15mRAO8lJd4kUjZUssu/uWm5mKDPEC
 cqdUWPPgY35rn39uHcLHAbJSnCIR/lMoi/iTpDTVIpCdKcxL1MLYlcxD79pEA/Kx
 O//5vDPWA2msoJ1HRRMWb86TfZ7s7lobo/tayKhoTvlAZsNAb7aTY+EwEsyjCa6Q
 zGTTRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69jr64-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 07:24:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3fae6f60so5982754385a.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771917842; x=1772522642;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75bYi11fyYiC46XW/yzaxaazSdDaY5pv28Q4r6DamKE=;
 b=EN59c3HzF0TcPBaXNiOeuTEp3C2+Gr9dsuF6Khoym2P07JwYJdQRadH7dRBQsgw97I
 ynDxyMLuRnQyblLXqmyOUomhvyGNzZywHoFWETedrI7Hom/ayOb+8bgjxOhT0zrQtt/4
 LVnln/b52FcfppoVkCxRe2OrwrhxNxqYl4pRwY5H5reGKYU4+M2ZDV4mdujkUQjo13Ww
 9CE819kihsCuCIO6Il0OxDjNhqoXSDC3OLI2Mn7fljJWwuGemRsO6Cv0nsUm1dqvN1wI
 dEYacRV9y6zq8f78xjdYtgpBDBYOxDlG+oag1AOwjHz+y11Ryi9+klynHC5Jkp5d9hYw
 p6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771917842; x=1772522642;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=75bYi11fyYiC46XW/yzaxaazSdDaY5pv28Q4r6DamKE=;
 b=ZT1JegSuAche+Nc4qF3+u4gMlwVlmuu7B2YrpgRCfAf/2rREf/D7USUhyZ3JdqzsmO
 wuSGhoSg2BpYaHAxpCLA6ED1qY9ICWUte7OVIISrn3qfWY9NzYvq/ptTVlLRjBL6b5p+
 c3g8r13Qrvt/zSGdE5tVlYLSVgS4SipbkMl62q8fVQSHQSlMl3Zzwlc1p+7mBcwASI/q
 S9YTyPj6if0al+0Q0J/aNgx0WH40yorSuaqafFAlzGbSe038Q4gpdLHtj7SZN8SSAuth
 2A4oInnReyw0NX+fffVeY/wLI/5ByaecJ8SQUQ11VHfRg1AYh/jrGiuuyV8E3ukQl20C
 fk2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqLuRMg6StEPLoLowccQ9rsngjAmqH9eCITjyTWwDqf3SjpI2t8ykIQMM7zW3Fr38XHZprHEvhk1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1oMP0OJNHiXpvLe3cXchZPBeQqXsocxPix/JUiJH6NQIlpxAg
 FGpMX45hMuaucBGBNhNA7wtB46ufCRX8/H0caGN9ydmz0WuXDXp2kXNnz212cXstGUNK/UMLsfT
 q70cglPi1/VGCo7y6/BGRau5xv2qNcZ8CtM2mZ/ryDR/iJN6DvO1w2lziW+vi8ScMFSq6bW0=
X-Gm-Gg: AZuq6aIgm+k8rY3ZlbNO4PQRXO1uW0xhROWzWUJ/YZ5tQuC7yLPdGEjUCFRnZiGro1x
 Nd95odoxe543fbLfTiJulsO4N6nwysCX7Y4m1VJjXbGBwjZg1UMhARg6R6q/4O9WplfTPugLiyg
 7fTg+CeUNdVM2r3iW1tOrj34jcFmHp/f27iJ3pReE91PSC72YxZOsH3j7DZNwAofj+kCiS29NBS
 W7zXmjMncpz4/XSfSJKECDx1IG9wzfItABiXXgTLh/pvcog+/KJcWZanNOH7CqYhfcf0WTAj7K8
 LO3boDPA7aiAe4aS6y7OFpITK/D7nZRIKzwYRinI5CNl/TkpwDlGDARd3cUfpHibLQzVHmaMLQv
 GZy46gF79iVFt0BHLIb6eJv96hJXG28jo75aOqswYBf3xy4xVdJYRslu0ovnlclRr/SXXkBqYzZ
 L6A9P4GP3SynolUeOuN6OF6ae48aAhoI/UyF8=
X-Received: by 2002:a05:620a:3949:b0:8cb:4d46:7a6e with SMTP id
 af79cd13be357-8cb7be5dc53mr1837544585a.10.1771917842091; 
 Mon, 23 Feb 2026 23:24:02 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:4d46:7a6e with SMTP id
 af79cd13be357-8cb7be5dc53mr1837542685a.10.1771917841521; 
 Mon, 23 Feb 2026 23:24:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a770ecb7sm21372311fa.0.2026.02.23.23.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 23:24:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260214105145.105308-1-mitltlatltl@gmail.com>
References: <20260214105145.105308-1-mitltlatltl@gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming
 dsi registers
Message-Id: <177191784049.440843.1605828631777709323.b4-ty@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 09:24:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699d5213 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=-6-yqrtIc-1OGEPD6ssA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: Q5FX0aDOhBa0OQmCizI3YEUEL_GJ8H9U
X-Proofpoint-GUID: Q5FX0aDOhBa0OQmCizI3YEUEL_GJ8H9U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2MiBTYWx0ZWRfX3ou9a11XaTAS
 R9ZWs/wvCF2y2kPqJytvgXsRkXNKJShBKixrgDJDEn+/vc1RrrktJHvvfl0AobucWLcybXjRimv
 hSjSKwsyrYyueUkmqGX2DXcGCaHuTFlEixfsh8lHJGfBpw2mjPrWcYBeVBoYtBsyIp7XN19T3E8
 Xvr58OJvXNBB5PbGnHo2/0h9ZLA8Lqjcr+96bJymbLFOEy/uq/AdNs3PKW5NW1K36nm5kR208NW
 VrWu7ItpCAAObE3sgrvHog5wnbS4ZNR8YrM/e02+zau+1jEV9n+zW4eIsNFKDjZwYrAzScWDDHq
 BaYwGNOL5JCB2uBonYs2OryUUIlYtrw3qINdRpmNZLI9b+KLREJ+EJoZghhgPuui5O4Lc7e5zHV
 4Z9k6v/ui/SF5hDBb29irUkTxiBByuTlnJiEYB21Wjewbq1VAKE5kO36lEjWsaWpOZvPAW/xSJk
 8D5rHXzo6Yo3cT3AXEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240062
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: DB8FE182FB0
X-Rspamd-Action: no action

On Sat, 14 Feb 2026 18:51:28 +0800, Pengyu Luo wrote:
> Recently, the hdisplay calculation is working for 3:1 compressed ratio
> only. If we have a video panel with DSC BPP = 8, and BPC = 10, we still
> use the default bits_per_pclk = 24, then we get the wrong hdisplay. We
> can draw the conclusion by cross-comparing the calculation with the
> calculation in dsi_adjust_pclk_for_compression().
> 
> Since CMD mode does not use this, we can remove
> !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dsi: fix hdisplay calculation when programming dsi registers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ac47870fd795

Best regards,
-- 
With best wishes
Dmitry




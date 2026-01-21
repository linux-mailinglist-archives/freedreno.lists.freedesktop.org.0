Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHvzHdspcGmyWwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 02:20:27 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211AC4EFB2
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 02:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA75210E676;
	Wed, 21 Jan 2026 01:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hr1P/qtU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsmZSbEO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8432610E676
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KL02mp1530230
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SjgczTXYiWgn6KeOMDJeRiu//VOKNRfEUziRnabI0X0=; b=hr1P/qtUchIEMSyS
 /QFTy8tYPQsm4DK/WNGlunWEUyu4EOrdbGWx9wwM2SW4XsXRZi2Cpa0i7R91XeOu
 6S4Y/aQtsUlgC9A3z/eWEgjXekbYomPtlpH5BMCeOJaOhX0zHTf6WnqVDEGSKjw7
 S14gsLEeinbfW5oAry/tPRB/8HRQDz7OaF/+XoyEUXWH8o1BvfVuc5wJ75A2VBrn
 7O8sTAya1ouGm3y+Rus8W0+CARRlwV+3zzgWsYVtH/prSfZg7ZRH6XaaECMnqLhm
 XGuAOEKvFqPe0hFrXvIdhk9P0ZjV4xS7f4lf2VLz2Le0eKVNRxRL87P9EZUusYd/
 zDhvrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bth83grdv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52c67f65cso312738485a.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jan 2026 17:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768958423; x=1769563223;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjgczTXYiWgn6KeOMDJeRiu//VOKNRfEUziRnabI0X0=;
 b=BsmZSbEOO0Z9zgUOjKoEtVbvjrjwjbNkZYQwhj/XDANR4kpNJbfclP54+LUfBTMxID
 8B/mYO4T/CAe1flsn06yX9T1o/ILUBSJQIcvcrLo+LE1GRNuDlHY+gdS5AXrzYGzR/7t
 6MSbWSzp8OUl4gUrqpl15q/3+qS1zPuXerJODYibiULAzcnvQEi3eKwTq8JjxpKldvjJ
 PwwAQg53qz7ji5DWgE8DIlJvacpKsX4/ckObwsKikZ8Cd5bhNxhlc251BEYqV4h3Le3m
 3ZLZE4mZxxnJy43qDDIzPQlBH5vMMj3i8tK1ND8eWBnSXGkD76xrri7RmGTPWgp9xspU
 E3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768958423; x=1769563223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SjgczTXYiWgn6KeOMDJeRiu//VOKNRfEUziRnabI0X0=;
 b=CI+msvn6Xlm7Z4M6F1tQlIKZoFiKKenqUnRmVyGG0GakwrBvjIDwiEMIQGyLaqTxCL
 /JP5HR7Kh4ixGKQtq5D94c8w7j1gQOvVWy3BUqJzd/azUYUPE4bqTtWuTNw/9QEkHO6O
 M5myZfqs2mvA3a3dl4Ou8gTZGYOBLQ/QkQirZ/RvzXKmUeL2BEyxts5Wgh1r72w3F4+Y
 MFrtrcdp79YzsbPXPKkOAT9WFaR/6s7TWB1moh1T+fav/s2Ldlkn8zcJVmxeUpvbX1Ln
 A9zhhK8hOhjf0/JYsZwhraHzh36SrJ6P8wWhainwOtzme3vgLGvN4YxmWA3e3V1MtkVI
 l6Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO7xrWp31AXv0bxrH2VL9JRbeZoTnCb7rICNmv1U+D/Rk1gpPWWK6DFs3cEy43bh5I4EopnJwujtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjpbO2dktk3AXof2b1B96ejkfMGzc24LhefY4iGGdnM3S00O9A
 Osx7izYcyC8oiDC9l9O8q3NVU6dVVEdwVoKE54Ij35fzHYKhRO/FkamYnq+xeWiIcp3gMamEugO
 rUIs8AQeJQ7CeMQzI8NqZAZUcyne1eKFTr78/oXBC6d1WgkX4ahgzw70Uubw7ihyME9zfu8U=
X-Gm-Gg: AZuq6aIpZ563JIr+RM/J8mjljp5G8VA5gfkhbZxwpMrPO7+B+1JY6CLJ93Gvsftx8Ri
 iWR36/WIzYr3VAf76Y/aWNcGHxO1d/UWt9IV6HP+2M6n9mq/Wg1M8RE0fP+ySIzqbNJf+dmnPHu
 RoD8k40bY7nq4DAlF1tv13QWH0/Ctce5WlLvkNectgo6tzU2znKUR/OAnrk7b2azBR11sQ5gSSe
 Zc2IZ31MrD2JeqL9K1LZ/LevMg2j3H/luu0xrvf05cK5KXOMf/BK3V4g/Q8/Dbv0zSZvt7NxqHu
 4vlFZNa3tdSj+j4JCaXwO0+3QTgplmA1hZPIt4pu1jJnT1GYAmMTHIzU3QR3AoKgmh9giwGP+bJ
 0qnYe5aLrOlqse8s7XESXbmTzbh4mi4iaJs9PLlrbHYj84IbADCdPMX2jgrLj83nLtMaPFJ8Yl6
 6LN5Usd66M1LwG9lDQ4OFCWTc=
X-Received: by 2002:a05:620a:1a94:b0:8b5:e783:933a with SMTP id
 af79cd13be357-8c6a69623a5mr2053347185a.77.1768958423095; 
 Tue, 20 Jan 2026 17:20:23 -0800 (PST)
X-Received: by 2002:a05:620a:1a94:b0:8b5:e783:933a with SMTP id
 af79cd13be357-8c6a69623a5mr2053343585a.77.1768958422624; 
 Tue, 20 Jan 2026 17:20:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3543d2sm4383110e87.43.2026.01.20.17.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 17:20:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
Subject: Re: [PATCH v4 0/4] drm/msm: UBWC-related fixes
Date: Wed, 21 Jan 2026 03:20:19 +0200
Message-ID: <176895840441.3580355.7884163607590067842.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VBTAulaSP4ZD64ZBfr8vgIHaH0XO7lTX
X-Authority-Analysis: v=2.4 cv=TeSbdBQh c=1 sm=1 tr=0 ts=697029d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=jLAEXdeIpK8u8Ys3by8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwOSBTYWx0ZWRfX6ZLtRJvFagts
 vwBrt1LboU+l4KFwWR1HfSzy9iTosw23V1u+SbmQvzEsUyRITyX00QbqMjk3QNOoIV+C5vfqpmj
 Yc2eJff0rYXYmPE6z+Jx9N9jTLvu1ip3L9WMFqbVEMKOWnKbpmLTu5W5PIaaD10KxU1KXtbqWL0
 5/L/jdCuW//1LoUHdsQpLUi3Uo7lVgY4KFj0bat348zrxHme3UnBztF09ro2u7dCaoJbRmJn+0e
 EaBOU2I7m1nd+/zIAdgqWlHgKXPR91ePftlP9MBwTS648QC02RqobFlwYoezW5NvMilJ9sCFDjo
 tnL1sQ+wNaS1AC02/W6U7P88p7Cp4ZszKUt1z2pHNELbJoXps1pZj5WTqrdHkDKFmIu1CSgG9nm
 cj5rEx/7FH0M5+Kzii67WihmIwnf2Zau0I5Nrei1nkQWd+489a77mwJFJzMv3QRkEXkVNVjJn/g
 9Yc88OFcW0YcTDLiMeA==
X-Proofpoint-ORIG-GUID: VBTAulaSP4ZD64ZBfr8vgIHaH0XO7lTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210009
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:konrad.dybcio@oss.qualcomm.com,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:stephan.gerhold@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:val@packett.cool,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 211AC4EFB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 19 Jan 2026 14:16:36 +0200, Dmitry Baryshkov wrote:
> Fix several bugs, possibly causing image corruption when using UBWC with
> the drm/msm driver.
> 
> 

Applied to msm-next, thanks!

[1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e6177c7a2401
[2/4] drm/msm/dpu: offset HBB values written to DPU by -13
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7ead14d4b974
[3/4] drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5dcec3fc1311
[4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+
      https://gitlab.freedesktop.org/lumag/msm/-/commit/258b080dc280

Best regards,
-- 
With best wishes
Dmitry



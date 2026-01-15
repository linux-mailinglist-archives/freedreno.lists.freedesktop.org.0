Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAACD289BD
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 22:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B86B10E7BE;
	Thu, 15 Jan 2026 21:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kt2BpJnn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bdwc1rP5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8146210E204
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FIwTjc2159764
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0yRH0jhM+jYWwNefo6O7EEWAY8TK9lDYV3nnRimBBgE=; b=kt2BpJnnIOPLzb/t
 T2pQToVIm4jefcFKAFEYgb0B3YH+X5CDOVZEUiMybZNAXiR/gI9BELDAiclL/ekt
 w78XrUzdrmPmC4w2FvkjprATZ8djSOYZE/CbPO0Pq3Wlf0U4AjIasTLI9o8LeB7M
 VRBOYqCMmZXrM7oITIn+IW/RXRICEZrRXolJ5BJE3LPxyKUjX60tP1Ry9sn+WgNb
 xpDmcjD/3GyabZdva9bylTKTgtHuiXheAKseI2cZ2X3+F45KNjaL8in/KoIQwmm9
 eNxeAmTXXGEuUSu2rQT2MXjRc9g1juOY/1umNc+EETJorixJ5pTg9yvN2YYzZomm
 DVk7Ww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna2fm1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8ba026720eeso404296985a.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511152; x=1769115952;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yRH0jhM+jYWwNefo6O7EEWAY8TK9lDYV3nnRimBBgE=;
 b=Bdwc1rP58dwC5yZkqX+kzylYGitkZvPiqcywdiT7jiH+6fCnzliaNl1YlpFyavUcpb
 bp9QI9Nkdji2l9luOXxefNgQcHzj7uUy2xWgVQdstC9vluC2c8EKJRYaHhzi1suFo0kF
 V9K0Z6J7TP/wGMcD6L/p6HbD3e/SmLOCPzDFOL1tjb8SCKZJvZ/govQQ27TIZ6cVZaM1
 9cxtJW3ixLtEDf3R6j9a+TlEa8hO97MifhPgFDEVsMiqv1Y/8s27AawYsLI3iP/K0wZu
 1gjvoE/4nPUrDNMcOgP7efPXV2pdPCLKQxoV5WKn7qGVA1h/eoMi4ZLTDadprayC+nzy
 6ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511152; x=1769115952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0yRH0jhM+jYWwNefo6O7EEWAY8TK9lDYV3nnRimBBgE=;
 b=V/NOBsK4O3/p7kG0MuEezkg8CRYL+/vx2q6mQVMkCesN0+XXMtl5ftHkoPFrJs5nY0
 l4/lYLjDZ/13RPJtF5bIiM//oxHR4KKHtY5dvN831x/7dmci4wLafqmPhI7NkBQq8ix/
 HxCSCBaxjKy3OPIJUZd3T9fvg1rX3LJ+Kv1Hb5lspuy78z8KIN5uE8sSAqZTuDH4bGrh
 n8SMEDMzT5Jk5YRKUJYfZ9yUokdPYAxj+paSvc6UGWkXSS0LQOpBm7vWcH/91D4bjJq8
 MVHyx+zuGvkfEmt6oa1NqQaIKtkosMTD+pWR5KkQN2TAFiXRg7RerUXDSLo8G+/tZkn9
 B2Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQbqQmor3AgeYJGA+yeqvdHmwQ73q/6mdOicakvkbE+p7ZChmXQxme9gVWmfotDQkpw2iD4mOFpxA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkkurY5hmFdlnY5FxxEBrzl6qlDdWcWrMOZuGubA0nwhyM330s
 3KRpvgqb3v5pGoklJrkughr1uGV25TSsCDHZEEeuUTkGZX9vPJUdSt0z+3g1eIAsZEQydQejDyG
 H62JhnGZGPJz5KJ0QHTHNLchNWnn50UZNK0j38jLbQhuO9X8Bgxh23putN2qQDcqoy2CkNYY=
X-Gm-Gg: AY/fxX5RAXPfio4S7xCf0zPAAP8mgBMDL5CiPEaCEGU92Xb9qZ3nh8dWxkLE5OzX7fC
 cxkKZKQSYHR86E4UGGPxoNNol3X4dHh3u1Aof4kKiFXDCALDaSCz0x45U47QF4j1mt4tO/cphb7
 Phxte6u0PkP97xMROD/EspsSN02IwGye7yv9utmeubVBJpSbbx6/ldk/2Q+xBDM4eIcpMIlqJtt
 pQ3f1q3doOat+Lz7F70VgwfsYVreLuDTqfPDkWua6L65vMOF6lF+mIVw865cZWlyI3PLOVpb9mR
 o47hZL19hsW72mAI5kAzJpXZ6wq2exq0CpfH3AAbBXaaMzYbM2vMuEPPD6VqaL1Ba5n1jCLrX7q
 aSCKvEPj7WnqU+PvsEhh287oXz1PIWG0RSYo7x3XLSX/UHEiThMWaUmGE6MANB2J1LKrkW7NwTo
 MZhYf8kH5Kr9xglRvxlZHBMTc=
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id
 af79cd13be357-8c6a66d1590mr131378785a.16.1768511152122; 
 Thu, 15 Jan 2026 13:05:52 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id
 af79cd13be357-8c6a66d1590mr131373485a.16.1768511151666; 
 Thu, 15 Jan 2026 13:05:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dale Whinham <daleyo@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
 Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: Enable support for eDP v1.4+ link rates
 table
Date: Thu, 15 Jan 2026 23:05:49 +0200
Message-ID: <176851111169.3933955.17203821768730103962.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
References: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: meBwQ9CsuNelV8dO5bcoXtuskK9h3HDq
X-Proofpoint-ORIG-GUID: meBwQ9CsuNelV8dO5bcoXtuskK9h3HDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX1gaqH+hEPRY9
 X1Ya0oto4JQ+nIijq4kPkj+lUuIc5Xb1rTcRSFwTHUVwnAGzMpPUvZkSbgwno/pBObHACDRnTiF
 qjkBo7eu7teipNFD6GjT4lAJDWJZdB0UP0wSeo/agvfqInY5ki9xTkwCuJeSWMVHm2pqme4giPT
 G3yYi8HbstTJQEf95bNCLRpcRTCYdLZ6IxFU5n50piD2VHx+faMEEq1mP9Gtx5fJv+er1Lg5Jw8
 m0mL1Km/D9Dp1ydlszXvKOfoUuJE65KX/MRU2G5YJG7KKerGhrPD0H5hC4eL4SpKf0IwCiBrpRn
 NXwWX77pd/Y2a6N8jSZqyYvMWgDzNNyujCQD8uo05wx11aS80S6L4A4xgmZRa3yuIJMy7jc/CzT
 YZB+SGQ1WwEJwq71MhT5isSinWyNfnwiphoOlCBtoJLfW6L/2Af04e9X1dPmbyJzcX+PoZkz7YT
 s0Q086UG+wJEIH8VHlQ==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=696956b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=uNR7pAaoB_IQ8-4UisQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Thu, 18 Dec 2025 00:19:32 +0000, Dale Whinham wrote:
> The MSM DRM driver currently does not support panels which report their
> supported link rates via the SUPPORTED_LINK_RATES table.
> 
> For panels which do not offer the optional eDP v1.3 fallback via
> MAX_LINK_RATE, this will cause a panel probe failure (e.g. Samsung
> ATNA30DW01-1 as found in Microsoft Surface Pro 11).
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dp: Enable support for eDP v1.4+ link rates table
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ed100aa239be

Best regards,
-- 
With best wishes
Dmitry



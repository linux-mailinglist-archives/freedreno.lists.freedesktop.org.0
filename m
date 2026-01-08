Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C40D0322A
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 14:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296EF10E730;
	Thu,  8 Jan 2026 13:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlyMPnHT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4+MwwqF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8810110E730
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 13:47:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608B2oZ11970168
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 13:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=n3f+etYRxsMiODiXI93sCH+C
 dwRw/Gwp4Q/CPiOkIGg=; b=nlyMPnHTfHlLNFqKdBvXDwOa3iy7HGZG9PbHWofm
 pplFiw5H/3M4z4kmSDsA2q2ki85US1/NJ79S5BKoXHUhbfqrVORwZhPrfYnXJ0EH
 wZ4jNRW27nUTSGHozrhgepEpQuDoSqIt6cLi5L98pAWTZvZ/UNJdLJs9EXj2McQc
 KgGr4kCLtaybYTFM/jDFK5iW1xav92umSpnk8MVI8ddRU5IuWZFEstXXSPJbZwy5
 d+5y6x9B7ox/IWTwd9dXrDwlvbvxsV+Eph+EA27HyX49Aue9vROnNjSgxd0LzgbN
 /7lYQaR7fYt+D1bh82+ZX/sB2Co9My2trnfhwBRIbzmqng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjbc4rers-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 13:47:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2f0be2cf0so539873085a.0
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767880033; x=1768484833;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n3f+etYRxsMiODiXI93sCH+CdwRw/Gwp4Q/CPiOkIGg=;
 b=f4+MwwqFAScViq8thWcU1SIwKgL2Y0mEtdOwIaVXOZwwlNHAPMmHRODkHHL6uNVdAG
 zwb5Z38aXNS6YClBHweOVqi37RkXpjw/MGi+GIL1i8/PXeQSK45gUYyfFzQTUevsiYYx
 LduI+iVyEBAsYnHsJmwZaGV0+B2KhUTZWjMYLEqJmcJdAhUJsOWZOVoX0XUBNPORFEQV
 IcEKnvkSx8LFc/s9gBk/kaYlO+O5rDnTWHteZpORfy0aw/t+L1TR+jOwn1+9UU17ZkpT
 CnwQwY4dIRJpcSK94vBrdGf1HKTDVH81f2CkO81cMEuDoQmETl86KMiX1j8cSfosA9Nh
 V7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767880033; x=1768484833;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n3f+etYRxsMiODiXI93sCH+CdwRw/Gwp4Q/CPiOkIGg=;
 b=w5WAvzqteDdpxPaRjhtdXVe5p2wJZXCH10FklY0b3ZKJkn8nq+yY4l7Gd24Uoj4LFG
 c86Gy6ab1aBaVncQ9R571htylRGxUvEQZzggh7B/YZbDzbIiOwYlcKYXOJbEf2Dw1+qr
 773mfGsiaTvaqhDF1at9zv/SBLChrk5Hnzh+B4xWA0lqOvV/Id6Z9U0Dsd+cPlnyTyrh
 ArVuReChvH0ondmVe4TBXMEeg/4m1Qt4oyyJ6G0reD6gf5GoFEsHp5tVkAy6LO/tShIy
 JxWdKPRU4pJxnV6/hs7WWydU5ICy7069LWf8s+i7GnbQ2Uqjts/MBvNjYf49h5a9Wmet
 iN6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc1T5qWsfEndCXErRKPbSjq8WtBzNLbSE179vLjjtyOhZxXTED6xYEnGQU7v1oarSyDim+GBC4Jms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFKZPGHs2GbyFzupIrSssZm+UyGVnrpkAVGph+gsff4Sz3zMfJ
 9hBxQMs/dZdD6JrA5YFERmjAxz6RV+yxux32cp1QUBW2vkz+6Vx/hNDJt0o5DRDbjO8p1+W/8jV
 a6ZCJ7wSttHNsRXpTI3t0+by+ysVjdEEx0DrfMj6cyWfOk0FMDohKFF653wwoq1IzspnRrkU=
X-Gm-Gg: AY/fxX7olrj55+f4ffVdPkOSZaQOO6acF8pYxZ5wE/DM+2CcC74pmzW6KRSFYrxxBT+
 rITpnPCfhZT3f0w0fpxivuw1XWyUUt4GRqTHeJASiS/3UVD+LntuVFg2cl2v1GyiFvMg2q2jGqZ
 ffAj79CK17djklXE/XPvHri0mXoNuNNpMgTOb8Fkz0ZQA3bWXGkgFcpanVtileeCPdnGeeMwicM
 1egVNmcUgYTgp6XBjmyuSfConzqoxYgyAW1CeavYPcTXeKgAQ7acD3wXKIxta559Hr4W3lacU4x
 slNt9fuzkacJ+Ngk3fJTLjOGIXOXSvQ5N7WtLvgAnSGh9QNzYu13fTA0ZkSmsLUgFunedhUov68
 w9dPtMOtvgPkAIU18uj/2nTln0oUhH1UdXeyg0aVo+p8Wy4pGR9aQQjlCQuwJHl6f9AXYaOsfQU
 gaWv3lG93J/4/98ms2WMw4mfA=
X-Received: by 2002:a05:620a:440d:b0:8ba:41b2:da01 with SMTP id
 af79cd13be357-8c389411960mr706759185a.71.1767880033401; 
 Thu, 08 Jan 2026 05:47:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbpFtpZNVM7lcaBYVfhMcezqpILdVwNfiJmxtPnOztyHBEeJGRheIjrGEnarHqtGVANi7z8g==
X-Received: by 2002:a05:620a:440d:b0:8ba:41b2:da01 with SMTP id
 af79cd13be357-8c389411960mr706752985a.71.1767880032880; 
 Thu, 08 Jan 2026 05:47:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb90a4besm14701141fa.41.2026.01.08.05.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:47:12 -0800 (PST)
Date: Thu, 8 Jan 2026 15:47:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v5 11/12] drm/msm/dpu: Add Kaanapali WB support
Message-ID: <mr67bnn2t73kdnh7fr4imue2jnmoofwlfn3btoj3etba3lybjv@jv4wajl62vlf>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-12-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108085659.790-12-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: q3stWgrGrya5758OQ_JfrpZMEC5vlw0s
X-Proofpoint-GUID: q3stWgrGrya5758OQ_JfrpZMEC5vlw0s
X-Authority-Analysis: v=2.4 cv=fdegCkQF c=1 sm=1 tr=0 ts=695fb562 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2ZwTbIZCPXwejyfJx6EA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NyBTYWx0ZWRfX+dOsMb/3ksYg
 2dKiPMEllfMw0CgofQ+TNjnYtEGyg/rgCMXmjjQHlHqyjgMoL01P3CDxbAtTQzKSJnrjEKUQbwy
 WoFvA4K1cQ5lT15xaNSL/kfMrUfeHf0JTjzEmICHY45UYXQOfKpME4uTDMORcbeWpKEvlOJnV/U
 Dsz98hCrDumkZktkwYiCgnN+nRZn58xrYCdQqHMesc6LN/3ZCQ6nHojmoL9Tb2i2lJyWUqGS3/7
 9u1+slEAz0B50jIA7sY51okMrBaQe/fQrdJa1NSF7Iw5nhBl3qOxxEM+l5TmpMMGm/r9+fMhEfk
 DveYh2cZhjBvrzjtpcKb4DRiI6i8O0qpzrrFISfiskjkRQCMoBTdXZ7f3AA46s9J1DrMwJOtuKg
 uWA9N/4N3O82+BDNit3wvtzCnLhbivyhIElcF3VQzkKbUnY8I3tZK79bdgEQAbPYg3ADSvOKDPY
 4wBrFlCs/P5rr+gFD0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080097
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

On Thu, Jan 08, 2026 at 04:56:58PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Kaanapali WB, which introduce register
> relocations, use the updated registeri definition to ensure
> compatibility.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

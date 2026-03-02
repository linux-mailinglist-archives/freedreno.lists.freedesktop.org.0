Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFrnISCGpWkeDAYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:44:16 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA571D8EAC
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D8810E4CD;
	Mon,  2 Mar 2026 12:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUoRwYfs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThqOGDxN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B1E10E4CF
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 12:44:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229K72Y782945
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 12:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pahk4TifdBrvSEGh8Fb3x77ODbPcW0N2RJ5yY1oXuqA=; b=UUoRwYfsG8b904Sf
 8nvtZlsVaFgVvM/hm2ATYKhbDqcTerzW2uA4dMWIiZ8p+vaJKHMoS3LsK6u5RvfH
 SL12qndnqyfBvkt6ZYISKgnxkJs6jCuIWADAYPTO6iH+AvcEkOiW+qjP5OFPcbHB
 PuBHdRP878DXXGCTAMA3Z2cT9OFqrRMVPy1KgXE6xWoL9C3rGAjk/1n/nRcqN1cY
 TpVGSHvO8V/cL1+XohE5gFD0lGfw341BaaP1Ja5pIEBZlk6BBBD5SGNKzDK7Qq8/
 02PUpisINlZ7LsHnnyimdNSbQTkk9nP0NPUGxo8tZcKDPMwiUPPUH8Nwi7kwVGI2
 t/p/Yw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00njg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 12:44:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c7177d4ab4so473631985a.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 04:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455452; x=1773060252;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pahk4TifdBrvSEGh8Fb3x77ODbPcW0N2RJ5yY1oXuqA=;
 b=ThqOGDxNkRyoy8vNzls8Q3MGq1D21lueEFaQa4glSRgO5aONFf6G3cAI+n9bSOaJh3
 KI2JM8Bgeh5W8J/7Dfad6oNrCiqAq9jM3Rs/ay/RRtnqJsoz4Ju/V8KqAKoCkPEYeNtv
 GOzOTB7X/LfX8vi8CR0ZFV7GmkWMyW/2jH3KEqdkQSQk7qrPMuRaNXfTEr9SLCzasXAw
 5ohq4ePJp/OfaDVHBMwjKmeYu2dYCfymfKqr6jNIceugzLCn3Albb72+GRsaOToK9skH
 1XzjYWFXzNPepG4jxoqC9/9bPD6Ezj5s4Tk+6poLwrKP+YyYoSFDPK1FFfDQWskolIuv
 3QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455452; x=1773060252;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pahk4TifdBrvSEGh8Fb3x77ODbPcW0N2RJ5yY1oXuqA=;
 b=sJsjODn+Y2XFgHcjoAMjk3akMRf1HQSjiztOM1foz3Lu2eZYnO6FnNDMr0KWzie5A9
 fVV89SDvWW47Po/8hXy61frKpmtyZQldcvsBUo+7tm0pYs6ZgM426LYf7RjW9/dv4EOp
 MyWyp7RmD/+lubpa1EjDEb1Z/Kr79HikM6UD65U1/izWZqR6EURhTbnKpfB9h0jLorxM
 7TOTZo035iPbw4H9o7vPguAJwJ4dYCh7teswIKJAhXweyXs6FMEvOWR+TzJe0Ip7IlFx
 ZtZhRdLdVjnBWUIns6r1UKiPJ/hz6QHRxS84uOk9IGymgW5n603vogNAAgnhoNC2MeiI
 RaiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz5K2TqPoBBGZmgZP33BIXs4l3L9aT0VpjET5el/TIZgo8JWSdv6P5KfG9r9Zngil8jin3Sy0Ugws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWW5qDY/F3FRs/anl2VsK+YR6/oFJZY37ba+eDZk+JCDuRa59u
 bbBWs2CY/96LLxHYIMTOoqBzONq/rNvUzdCDEBJcZ+1wGOOih9DfZz9cDZfettjoNsGAYqm7kcE
 xZsE0/F2mXbOOsuZ7eJp6JS0C5z4LWMDYkCMtXdhlO7ZMW06mA5+dH64Eyhq9D11iPdo38dQ=
X-Gm-Gg: ATEYQzwfo9k5SWX2kxQIC+ksPhTJEBekfmHup+CgiG5SPlCG80BZh9THSNTPtp36dN8
 YcBl9/oLqbvlYLzc2wsqkh2nVXr8pDgpTP1Oe8NC2osVFI0o1LpQb5JbR8HTsVzA0f4C2fF3jzg
 WRFVULeMrRA3b5iq6idyzxxwH0qsGieMgW7JNUcFSFTwRLAupSZIZ2qbP+lwbBvUaCM73Akx1W1
 EJE9iAlDu+g3lhqynIwZYSXV4zZoZ1kLwDfyU6KhRHC2sGxTX89TitaAMVTmw49RUk+toGVzrAV
 EH+rIhPV5/RyDRyG2sY/GyL5t2xqYh++qjkqLCTharYcDPVTFkroNogWW9TCvS+pvtXY4Al+21+
 4ySuzaegFKQNc+YQg6Pa8Q1J+FRpJZvRytDiRPg8KA43AbHxsk/sXkobIwYjcJdf25ql8IksBOL
 dxc/w=
X-Received: by 2002:a05:620a:4607:b0:8c5:33bf:524c with SMTP id
 af79cd13be357-8cbc8ee61ddmr1276843985a.6.1772455451765; 
 Mon, 02 Mar 2026 04:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:8c5:33bf:524c with SMTP id
 af79cd13be357-8cbc8ee61ddmr1276829785a.6.1772455447431; 
 Mon, 02 Mar 2026 04:44:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae95114sm470916266b.49.2026.03.02.04.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:44:06 -0800 (PST)
Message-ID: <e9e4e0b9-fd8e-48ab-8e12-c62e0f6ec17a@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] drm/msm/dpu: drop VBIF index from the struct
 dpu_hw_vbif
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-7-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-7-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a5861c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=htV9gPYb1xck4idZc-MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX/nPd/UFZDufn
 CO/flde2zOvPoUS7xHt1g6dqjaTs305cQwoV5K/PoZniiOA+1hVsUALss6GPDVeG8lHbohHezb3
 +WosCVcp0L7OmoGF4G0FhnO95jRIiKTfeBHAqOpM/wlu38wrxBnlhB+uv1AwugSRGMIG1ZYF0EQ
 rSAmplbe1hsLopgDI+TCoN6mUcUh+DHUaY0+ryNhjilY5F0PMkXjtKdfsRhc2jrzMZpMxatesoN
 GKk0JSEjcogAqQGStNvsiciaCR0y1uiC/19+6d1qszlThq8GAQI4ZaIhfLpDu9YhWE5D/2YPl1J
 /+b2aqKvRoGdtwvgKMAxc7xdzoJ/mbTk0k4LqDs0XRdmI1Htp62oDc8z13wwulDAv7/TqnkiJYr
 M2OarFTNOslwOC+4trgoQlfcxEWRNB5O3Mb9EuKAMGDYw8Bkk/3z2VwvbwcsmpB63lQJ1HpxjrH
 QuYmqLraqorrQMAePtA==
X-Proofpoint-GUID: T8lhnEcQL89r8qWxunWgDyFW75t0gk6R
X-Proofpoint-ORIG-GUID: T8lhnEcQL89r8qWxunWgDyFW75t0gk6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 1BA571D8EAC
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Since we don't support and don't use VBIF_NRT, VBIF_RT is the only
> possible VBIF type. To simplify the driver, drop vbif_idx from the VBIF
> instance structure. As the last users of VBIF_RT and enum dpu_vbif are
> gone, drop them too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

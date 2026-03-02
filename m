Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKgsK3l7pWm6CAYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 12:58:49 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CE41D7F64
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 12:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022AD10E4A1;
	Mon,  2 Mar 2026 11:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="psr0z3p7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVUuMvse";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A219610E4A8
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 11:58:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622B4MhR3561536
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 11:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3WNHECvu/6QeV24p8N9UVzc9af0Iga1Zc8PGZ6Ufnc0=; b=psr0z3p7AvzLOiTM
 j+SlRSR7fCcF8tyEj/kaQ5VfiJ3BN5mKSD2ucuqEQ4F/uS9eQInsOF71bc9dEIEi
 dLcCNHcCiAiKYOemwblI9MLozAl1mvcMd7SNi4xunW4CTy5xXz5s9f8nmURw2PpP
 tLO5POrCKbxTe2aBlPrbLlYNEYZkwXAPIG3nE8fDKRlS6/WjFEwP/WQymDC3gOi8
 Hf/3XM4+/AmV7M1P4e/VOIOrKooyXd/apgRea0onJnbHzJOTxjwZRP891/HZWCBa
 TOM5rx7KUgmGEOzuM8t1+4QnzMWzW+X131MGIq9FdqXWjEAEZTaw59b+eWBgaOti
 qj+EEA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bv853y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 11:58:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-89a012f8ab7so2902286d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 03:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772452726; x=1773057526;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3WNHECvu/6QeV24p8N9UVzc9af0Iga1Zc8PGZ6Ufnc0=;
 b=ZVUuMvseBAhWRdGLW9fMPgwDBAvMvh3fQvCS5CAifqZ0X26eEVpqEXwfJfB5keUhyV
 wvo1qtxHIETjfw2TBqSa5kwuureGF6McSfdfLZ/m77RYfu7KrjGg/x+Ti0GraA5A+IbL
 DlxmaT2DVF+ynm33hkb1sEr3qIu1lPt8Yf9zIp6vCx0IMkhH0DOL9T3xlq/+4Fywx0p5
 1/F8jyHlrKcRyrAMW7KfpW045/MmpK0a8zdXO4w1smkMzg60MThXYFU/3TcRr5m8JYPs
 vH4yU+i4CWysP8btzNmNnDJ5BCtXqJmSvL7Y11VGA4xzh+xES0DZeRtsT0v3U38YH8eZ
 n4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772452726; x=1773057526;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3WNHECvu/6QeV24p8N9UVzc9af0Iga1Zc8PGZ6Ufnc0=;
 b=WPu57N5jZwLG+jMlhaHFcFWoiymRxXYvmO0vuFCYg4YTNBz+JDmol+EF+LtVTctl9f
 UQSBZHb3HpZobz00yGBG8YvNrQkZIZauwQQBQEbUTHexM2eePUgJ2dPXybMMZqaDty4k
 hn0LYH4kgu56/wHSqzh5j+qNXDTiX9ifHeEM/dqKMFrP9j6BjiqnfUb1csWM9fSkC6G/
 5436F+TfyOlWK6XWA3nCNDjCXs9rxdL8uLKCbNNeVtVLtEo/lx7RPQJ+3tIuMR3F5q+x
 60O0vs3v4J7/HMXo646d4k8hjIrw4mdtdkMirKrfO0lekipnj/wTrQ6t4HVMw0FRkZqO
 JE3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV65svjIeKveXkmgcUh9pW56IrJYHCDuuH6q36XmnA8J2Tk+TgBXRYQXPEp8X4WMlXftM7gd0o5akQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5Bo7Vow1b/a32BhxwiJuRttMhic56pv3t71aOUNdPZI/nFLBN
 Z5dNNcOIylNcei6g7vu9ezk/3dpVGIbo8BJqXF5irg9KMZKXeUuHIqAX6mGkfulbif7bzAPJ73h
 E3/T3ATbAIz7gC0m2DcgpBCkS2oR0USrtntY9UStG1Nsm3dTQu8NAB0E0vp+fZxEImY/rdwo=
X-Gm-Gg: ATEYQzykyl9MQuLo173+6ESFubiyY0qpcNGtEaErTVycLQjodhPW4CjxFNL/xd2rJdY
 Vhz3oZPx07aIXEnAuPRFHp+kPJvbyG9C278IX6uqN7YtWc6GzfYrAjwryKLpkrUmZYofMtQAq24
 bDc9zQyL1MYmakwVPYAm6vt9emEVB7FFhIoYZDeLTXvNGAfcyJQ1kUFiV6LQmKRcgdkEg4/LAO5
 SyL5IPmJbAr0khPX11ejDy1bFRZaLklWrOHxc0UvvsNoxZ/IZnWQ3HshsG2I58YuEDXPRPggZCm
 sb21JCG0S2MzQK6+jTdTs+Xy5jVcg4Y05fJ8qhRC47zoid0mpw4tCHOkUwLFubMI4HW7Kv0dV+l
 quqh4n3FJYp1pNUNb+socsP3gdjk6d56l8kDR/dzYWABz32HLGd3wu1SHBmMgzvGk96RnZ0uFFP
 Cwfbc=
X-Received: by 2002:a05:620a:4014:b0:8c6:a707:dae7 with SMTP id
 af79cd13be357-8cbc8e44f42mr959409185a.1.1772452725861; 
 Mon, 02 Mar 2026 03:58:45 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8c6:a707:dae7 with SMTP id
 af79cd13be357-8cbc8e44f42mr959407585a.1.1772452725444; 
 Mon, 02 Mar 2026 03:58:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae60c16sm461969766b.38.2026.03.02.03.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:58:44 -0800 (PST)
Message-ID: <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OvllrLmL9nkBHdU5B-v8KtWLJ9wVvf5x
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a57b76 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=plQLfFj-HSFRXCTsVOsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: OvllrLmL9nkBHdU5B-v8KtWLJ9wVvf5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5OSBTYWx0ZWRfXyAUJ5Z+zAc0O
 Sh0Y+sWCgEh8bPRtA9YATlsAw5uU9+TH10EMjUTAe6AXix5BofqFyKZKUw/v1R5lJtNk2t5QtDu
 cSinG7gyCig/Efr6vBj0qJQYh4HSxs0IBR1El1JKZ1gMtxxeH6NQyea5dW67FvptECg4ciklunc
 A8zh9zTxNU18vnEvNbMUUm8RZZNrHKIVaaZNV6OrrurAGV3LLMTFuaDJDtombsmeImgNFVdfxKH
 wqnwnlHTvUQxkzOkDGkImvoxgvSc/a3RBHFlwVEYQ4wbefTJAcTHFC7Olc2SYFeJIQnuXok/FXT
 hZS54IgR2hN++V9X69A0ovJJF7N5EwRcSxP/RR9vI56RARLvONdYwUrqwhdseBgwIyqJSRfgWFR
 83aapynMkyruytdW82NgfuQ4AnYYp8S/Ih5Hmky7Inc+3y9Th+sRrZHyaE5Sr+2vj3mCumz1+O5
 oB4db1WjNhfzXCYLDGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020099
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 29CE41D7F64
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> question revealed that it's not actually used by the DPU driver.
> 
> There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> VBIF_NRT being used only for the offscreen rotator, a separate block
> performing writeback operation with the optional 90 degree rotation.
> This block will require a separate isntance of the DPU driver, and it is
> not supported at this point.

(in case someone interested is reading this - patches welcome!)

> The only exception to that rule is MSM8996, where VBIF_NRT has also been
> used for outputting all writeback data. The DPU driver don't support WB
> on that platform and most likely will not in the close feature.

Unfortunately, it seems that way. Fortunately, it seems like it's indeed
isolated to MSM8996.

This patchset is tearing out a lot of abstraction (which would only be
useful for that SoC though) - if someone decides to work on it, do you
think this should be effectively reverted, or should the NRT VBIF be
instantiated in some other, more locallized way?

Konrad

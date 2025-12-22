Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86ACCD557B
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 10:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA0A10E592;
	Mon, 22 Dec 2025 09:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ao204+l3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Joh+dfjE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9236310E57E
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:36:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM9Yocb1603486
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Kq3LMdMdij6fkif2PNLahCRwz5DF0om84C+pt+8LIEc=; b=Ao204+l3rub0U4Uo
 nt8KbxBgvEmGSjTLVa+80ofCTjIkmpS7GS9yV6+NYbm9vmdBlhiKAookikqckw4S
 hHTTOZ35YZccV6sDgOI1RYjcZyJnwii8O+ofkC1eLNp+4nRBvbfCe7k5yeMWchLa
 9lGd0Qo+TP6jN99eJUWEcrAG8C27mqQ4aDKeA4XS6tAvTBTHGMqAob7qDaK54FtO
 +YPiFbNT5VFGRPrRPx24fpltJYbQPWTTF5pTXlMozRn4fSY2v65VpMd9SbFtN8yG
 LqZBxPce9mFcwP5at2CKtzOWyEQrq6jD8EuBv5p4k36cJY7BoYEi2pqvBh1GS2Yl
 ExzRxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwr054-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:36:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b5ff26d6a9so98623185a.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 01:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766396165; x=1767000965;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kq3LMdMdij6fkif2PNLahCRwz5DF0om84C+pt+8LIEc=;
 b=Joh+dfjEAymcySC+JfDLmjRpdmv0Ukotdy7gKtuMknUaAwBCoMsrEE4jmi3UH2cOiY
 x8rI1jEuomy7tQQd5ilU3nEUy4Ze4A2bjBg9PoRqHjEy7AKwOqA0L7JX1/wuSsDkoenD
 ggo4wsrqSkK0HqA26KRsKK493NwKblWIVuvKmDPqYJeAKrpa8CSjwJa+4M5K6n29Eu5H
 7XwUce9QAz1qng7872d5g9fC0hT8NAzYO52w/A8pgDtDKBOmhVxqZAwDf7u6yqgNF0Sk
 aVNGojhn0ILyHEE76p0g4hewj3VKR+6+EoDGnMc8lFL7AvrSkVQDLXyiT2pQ1W4w67bw
 jzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766396165; x=1767000965;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kq3LMdMdij6fkif2PNLahCRwz5DF0om84C+pt+8LIEc=;
 b=SvqPDG9RILtpB97S7AJPKFwvXrFlSV0XOApNkVb5pyYP99KMSVmk2WybHRVKam8E5B
 3kmYfCCTXG1UGAt7tyGSg7AepOT0ThLN2TUiD7qAYzZYMjl+yL8gemQ3T4maO5/GJlnO
 +j47G6FgkOI2QfyaTnaP7cZciQXVGbSQ7LjjixpMPWdfH74eepAXLX/RCLHjMHrEvvwK
 MWXnyiuQ0o31mr8VX4TlQVQnXjHVqIQZlC6fgzyYA4SZKbdC63hnXxQDiYrhnsG6JlPI
 D7Zg4hhw69udwvfa0ZlFX3PwcRaaoZZuNC+FHwNsBrjXoWHPgwiq8nzc7Mf9SJxLZ/Xi
 yJkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAkq0loswl8ds0kEAoxTHOMcJ29BGQtBwdqtal/NqW9O/4bXK0Rqewz/4g1rEeDZKnVzQ8gs1cxxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfOwoWs8+WLEl2r4i9juI+6j/Mg8LR6mqi2QBZyKgEOh7FgGUj
 qMNvqHVV9BpvxWj6FbbNEparlXQVH8KlEyBHHXTz5bThvPGQxupwmhtxWPGcFbKYBqI67HbVlr3
 aq5HargFYOcGgjbQxlV8gm0DYf41P5ShsTfHQdWq66m7dOudq8ZiDblnqoDtq+NPXtJof3Ok=
X-Gm-Gg: AY/fxX4RS1MhIUfeoK3Ghm83GKpXcgL25iLqm9f3rEOj7/DLKRwYm4X5XLyMT7rPkLw
 LzY6+FcK0yN6yxI7iM9dHtdzgql7UXQZYHNYZ47ycpnft/IjaQn5R61Sf/O8BcIpTe8JNCCRxdz
 2PzP/VSQCSFVPikLTwlvaKDLWH2gTtAewAMZKc9SVUPi56Y2T7OnM9Kga0VCgqdgjqa2mCAYLEC
 e7UyNbtEOgd4Lo9TgsuYNhDDdt9EvvmFiM5HORMEkLqEXlTFm/2cIq87bffGnAXJsRd1X+Sw4HI
 GnzYsME14recDHw9FahEL8X5G4U2rgt3l9ig4NIOjHceIwBbEO7WKFgRV1PsAmkg717mDJRwfjt
 DHda7Pg787IfFHLFnV+kENLZMLCdEagoqxVnZ+Br9yfQw2arrwcLWQApG2pXIpXZLTA==
X-Received: by 2002:a05:622a:6a07:b0:4f4:b372:db38 with SMTP id
 d75a77b69052e-4f4b372dc2fmr65536211cf.5.1766396165102; 
 Mon, 22 Dec 2025 01:36:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWpek2X38QiRtdwckvzye0DRKZoNSOPiseCm6P/erYFzBxx49LJUA8iJJlmbhUn/duX2bSIA==
X-Received: by 2002:a05:622a:6a07:b0:4f4:b372:db38 with SMTP id
 d75a77b69052e-4f4b372dc2fmr65536091cf.5.1766396164666; 
 Mon, 22 Dec 2025 01:36:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b90f53c16sm9874135a12.1.2025.12.22.01.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:36:04 -0800 (PST)
Message-ID: <a401c58b-a0f4-487a-8530-1c6ea411ff35@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] drm/msm: correct/add a load of kernel-doc comments
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=69491105 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QSihu6i2WLKBEhuxrFcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NiBTYWx0ZWRfX2FVhe168mHAi
 F3oZVcX2Wnq/YNGtE/k5a02EZwBCHkYsvMF+nxMJa+nImzBRv4fFbIMyZ7n66nvNeRFQIY4wpsg
 sqWcm4S1c9gxacVsvPYLlTX8GiTUynDAi+wDSjaVu2iTx4uf2/FYp+ixHAx7kyhhRGmLtehJLfe
 INYlzGmBowm62EqggIumUYOPnTX/hRhNMOMzjAZbiuY6EM9sLhckFpQemjdefjO9xXUhp1Etmi6
 H6z8oFWSpnXBWANqMNQ2/ffoJcnf3CaWD8cpFeuZ2bQUQPA5MU/RY3Ix2lWdk2GNQgSORFAJyw8
 i0+WX0AabVqW4VLMc7QmjF9AmgRttRED8bno694ftAX4fmiN978LkW95yXzybExY3yJOEth+obr
 WdxAwcYC3usZLE3uVu/CNeIhoE1mDxBuL5TguMG7Sf9qTMqxxTfgnWcSX4qnvVNYlJKTpFyzHao
 c/p3FqSEdMOByJZcN/g==
X-Proofpoint-GUID: yxZKMBpcP9Y19r5hHdSu7mv-VjwFFpQN
X-Proofpoint-ORIG-GUID: yxZKMBpcP9Y19r5hHdSu7mv-VjwFFpQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220086
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

On 12/19/25 7:46 PM, Randy Dunlap wrote:
> Correct a bunch of kernel-doc comments in drm/msm/.
> 
> [PATCH 01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
> [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
> [PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
> [PATCH 04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
> [PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
> [PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
> [PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
> [PATCH 08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
> [PATCH 09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
> [PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
> [PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
> [PATCH 12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
> [PATCH 13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
> [PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
> [PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
> [PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
> [PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
> [PATCH 18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
> [PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings

Much of these comments should be rewritten, but that's on us..

Thanks for taking the time making them at least format-compliant

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

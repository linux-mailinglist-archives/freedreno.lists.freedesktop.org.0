Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CC6B16E68
	for <lists+freedreno@lfdr.de>; Thu, 31 Jul 2025 11:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D7910E72E;
	Thu, 31 Jul 2025 09:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSeyS4kk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6932B10E140
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fcPv027103
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tyAiPZN05+p3QMCIsbsm3CJ18gwqmsxE7OQUlpLa+6Y=; b=pSeyS4kk+WgAAnwY
 BnB9TcCKMH7aFAq7f4JT8nTSkiiIP6AVWRZ1X+GXkGtRSHQjNEJD1rjszDN1tHqE
 Ig4CmpPgC1chcXjQd+xX9pUKIspPBfQCQdLbZnboz3J9Po361Iwz9rZRiAX0HO8h
 nUmFiqiHXD+8ft8mI+etNuBqHaDfeeBUK6oxAGXeDTMwN1CClupFeEm90Gu28Adx
 ebfkUGVuUxG15rliIYw/9fHrP3e+HvVj48d3SN3PA6f/HGndAPQ52EVZBLI25tPT
 jiCoZsXrzYGNz9yv31Lm2bj/19xS3LXrZfhZ4A2cW1on2SA+fiLncQ9PTDWgjSoK
 JZrQYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jweujrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ab716c33cdso2775381cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 02:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753953677; x=1754558477;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyAiPZN05+p3QMCIsbsm3CJ18gwqmsxE7OQUlpLa+6Y=;
 b=un6v0EtneMaWvW3ZjsTvpoKra26Q05gZiFmmFtEMEN8WI0nqAiy9TamasDNT54nmdw
 0eizOM1lqQB2lGUf04CoSWC131fg8XYdlPq8I4uFQqLJqQC+Tf8u1vQd6CmzSArEf2UE
 ezBAWlMRMjqMPW+z7nvU0WI07SSwdrtFi8pr8s6vmdblWgpgT46ygo/bXk9xLkPqgKRV
 rpdgonZY193esrXopSOctJW0sfxFTAeBXm29Vg0bJVuMf8YtUQ2YhDLYOfwnJJ1qzUFX
 KT3qWukpjItOiti1ea0bDqsugJrfkz618w4DztsLkkWHFqIRe+GfrP88ti8NVrL8nd67
 dZ6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWj8SMg6EVX8ykCP4DbMWKU/43AXEpa3FJ9BkYESr/EUrjgoGUX4ZnjAyAWEHV3tMFH4Eh0NCGcKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzpr+1FHwJRtFJwvGtzKTIovceGOYcICx9i4kTVUC5HGiNm0ceZ
 kVfhG3X7X8+QjW1nImjEIUTKQSEOo5lkmFqbJcLsUghQW17e5/RTXeiVjivTAQ2Viv76vZxcN0g
 GFvqhu0k8JG8bcCsmn9DOHQiS8Mq6VvEBXffU2e0DjSPNPRMjY/QVDYg5rmKZFhdEyBCVEOw=
X-Gm-Gg: ASbGncsB5ANuodaTP1Lgh+gjqOMdTy0S14FpW9qVD/bNkppVA+xwxqn0qJDcgulGTdA
 g8gwCxbcwPgBveoJY4FIuFOMQcMq3exHkD8CoxKCYfJjmHO8CTcr6M2ett3HD81s8pfZi3rzRy1
 wuhjC+uV+iE51dl2n+PopLX002ckW/oWiY1Q3GJCBt2PXCH+/xh/ZZw3ncLdok90X7z+PtD73Cb
 w5QQRDD9c0PmmOwqPAFQ5xK15xrWIiX6AN/mYL/rfoH73GuJkaZ5khcpOW+4qDjisEF4HgkzbJ6
 NM9vL1mEVhovClUbATlJhznVfmIGX61umXcHz0nks2NlMUHgqEtSRelnF5i6dUyfOCXUahtCFQn
 mjDy4xhGBefTfXJQuAw==
X-Received: by 2002:ac8:7f4d:0:b0:4ab:72c1:cf31 with SMTP id
 d75a77b69052e-4aedbc5d109mr47966911cf.11.1753953676635; 
 Thu, 31 Jul 2025 02:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg7y3Mzh8kLpvXdgFmJK6NcsIZpRA/EOh3rdkLqhLgosRXc0fkF06g5WZgKCLXL9Gc73OGlA==
X-Received: by 2002:ac8:7f4d:0:b0:4ab:72c1:cf31 with SMTP id
 d75a77b69052e-4aedbc5d109mr47966681cf.11.1753953675720; 
 Thu, 31 Jul 2025 02:21:15 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3792sm79613466b.50.2025.07.31.02.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 02:21:15 -0700 (PDT)
Message-ID: <304124f3-3686-4a04-808c-7ee84356966e@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2][next][V2] Fix dereference of pointer minor before
 null check
To: Colin Ian King <colin.i.king@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
 <20250731081854.2120404-2-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250731081854.2120404-2-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WaYLSsoaFBwhPmi4BV8k-seOZnnbx2Ds
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688b358d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=uhsglmO2XhRCQ2AnPp4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: WaYLSsoaFBwhPmi4BV8k-seOZnnbx2Ds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2MyBTYWx0ZWRfX4XA7As6J5AWO
 XbIJsNxhcpnCpd58ddPDVQ1fE0xA+LVqcxLnApUnUB9hMNRtdLU+8zvV9v1Uuyj9FnlM/lyBgYq
 e+U3uvTBrnyg3WuEvYbguGrIz86yuejNlzuq1udZUwNh3VGrU1RRq0NNXhzzwNa5y5QbNUgO6X/
 fgMs7fBS9GtHM2PwU9/1VNyeTVoAPwGapLq/Pq58lWybZripfoQsiUaQbvGJvtkdwFKNYkffBtf
 WI+NW/RG+INkgAEvYHrGyK72KVtCqPwAQaySjhSKSkoA/ZE2VwFDVpev7M6KeawIb09yIakgIRo
 V0vYM6+EoF5dbEpuQxCTVUtY1sNTgwVelNB/qbg56Z2jDa+ZHcMJfrQ2qWetWQNfVD4hFtnv/qc
 4kmRHuYWcPSaHObVNbzRgVVliSKFPdEh4ihVUYzT/S49Wx8lw1YICIG+4GagpDTTT22e/tlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310063
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

On 7/31/25 10:18 AM, Colin Ian King wrote:
> Currently the pointer minor is being dereferenced before it is null
> checked, leading to a potential null pointer dereference issue. Fix this
> by dereferencing the pointer only after it has been null checked.
> 
> Fixes: 4f89cf40d01e ("drm/msm: bail out late_init_minor() if it is not a GPU device")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

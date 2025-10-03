Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925EBBB5BA5
	for <lists+freedreno@lfdr.de>; Fri, 03 Oct 2025 03:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A82110E869;
	Fri,  3 Oct 2025 01:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="adZtzzby";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E0010E86B
 for <freedreno@lists.freedesktop.org>; Fri,  3 Oct 2025 01:17:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592HJx7j007817
 for <freedreno@lists.freedesktop.org>; Fri, 3 Oct 2025 01:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NszYJNXUum61Ftvgh9BoHIbg
 Xs/NhaLC23ASv+k9yTY=; b=adZtzzbyNJG4Qibg2lpRct8Xd0WYI9m+fpgiIP8j
 RUWhvSXufHfFkNhTt/Qd4g6Y8vxXkw43zAYs/r0yTk0bpYNl7JdldY73vSVYXhRa
 EnaS+KHtE5qBhBiMhyp0Bk/sto0n/QH/NS3Wk9wXxMzB9YugqdwOAXgkkO3K9qyV
 NeJEycjjHKmqwWbxKdLJcYd3Y/WvhzxU7UK7Yci9U6f/MHThFUhY9d0TPaQTumCt
 GCLTj7XkejVhZjM0N78nBT91y4S7v3S5RTSEjGvKzxckNfErhPQMmzSC8H6xwU3Z
 eYIHRp/S6Z8B6iHyLgdkY09AQrNaM/d5OqeRbg2etQ5xew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49hkhh2ma6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 03 Oct 2025 01:17:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e0e7caf22eso43692251cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 02 Oct 2025 18:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759454228; x=1760059028;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NszYJNXUum61Ftvgh9BoHIbgXs/NhaLC23ASv+k9yTY=;
 b=oJnf84M0yCvTFvKZbpRtVKEVRIKOnbWjqQL9jHkKEHqKg3rdjsHhAJi7Xg0t7hpPU1
 rzQSbTHZsyJV1o/E20ch2SrNWEIb6N2e3vBtlQ6yg5uEhly/OZZWu4Gyd+1DcXRAA5Se
 b3jNgsegmmwvbwWLtwmgPa6ta5IOYWCBx/T4MxLH2ARuh56q/zVyxb7SqWKDhYFamZlb
 /+4baLTKhHiE/EP3ojsEIRlQ/OAVBU9hoz92NC984IVd0GuhDwefr4p6XCFYGx9sbbeu
 GtSQLUEx+6qifOxE0oqUYw2oyU4xjOpz+NbIVaBDbLbm8LqjPU0teWzGFU5QprAKK85Y
 l0XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV673AL1CTqIR6CdbXKcFXoXlrWBtp8UtzUSA0WeQkRtHKMmU1BGqZS+Upu+hLNv+Ta5Za7lf+/rh8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX8OR4DAs0xlnU3QqAKzhQda2XRdxBkpdaTRctCNRZpOLNOX8k
 G3HG2VlPMeelFVi1ejiT0icTyNnkLMn9X6/+3l9ByrYWKeWw41I9RFhl12TpQw5VYIGF10YRaZ1
 HLdvr8wDkrakQN29jplsB+oTpreW2wfaNb/NDphU85/FHEY74+O2NiEyUZcHfHAua9Mz2+5c=
X-Gm-Gg: ASbGnctBr/92soj9gpNgO0Q3daofJnItCDlZcvdAyaTk9dN/8fnGe7Lg5cvStxaq180
 IF+HqmjS12WUZI2ofGmk8yNXczX68MFejRobhnTtTJ7MbrzBitV7/FGKY2eGsUZI2CeIAc3BmVz
 WZzhT0L2mRtlMy4KPm9pqDmgQCrAOXDW43kI1HWncBXaPKo7CSQCcFXH7DGWrQh3WW2LdIZkuCz
 VzW/ciEfRcy8Jb1vt6luWheumsKgeF4asqPxdp/SoBFm4QL4Y2SxwTK4vxPU0AraKKxFIxL2Cll
 z53WlwlGzzuT4mjqJJRUiK3+vAelM4erc/WmWionsPaN/R5kue5UmbH5kie5lOHCGn9hT3pfmL/
 YO07gSiWkaZIgnIKcfUK1Ie76QGhqybFWh6rdbsX7Lg9Jwwk7mdjmQahpTQ==
X-Received: by 2002:a05:622a:394:b0:4ce:dcd9:20ea with SMTP id
 d75a77b69052e-4e576b13f4fmr21738241cf.57.1759454228073; 
 Thu, 02 Oct 2025 18:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7wGlhN9Q1fx9OZHmwE/WJqZbiUdV2GSH/vjmHZyoClwDnnRtTJTDDldA0C+AO+Zy05bZYKw==
X-Received: by 2002:a05:622a:394:b0:4ce:dcd9:20ea with SMTP id
 d75a77b69052e-4e576b13f4fmr21737781cf.57.1759454227579; 
 Thu, 02 Oct 2025 18:17:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0113f3ddsm1316191e87.52.2025.10.02.18.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 18:17:05 -0700 (PDT)
Date: Fri, 3 Oct 2025 04:17:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
Message-ID: <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
X-Proofpoint-GUID: Je14Q6EpLW3Gncv4n49mmrxZISEYY06H
X-Authority-Analysis: v=2.4 cv=cILtc1eN c=1 sm=1 tr=0 ts=68df2414 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=snQqrI5GwQTDGbkEZYgA:9
 a=CjuIK1q_8ugA:10 a=2MHBSq50hwYA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAyMDA0NyBTYWx0ZWRfX24kInPrdpIt3
 lC4NNo5BYcr0MW8RWs0QHnS6tOhln16lCHYBMISsHMVO7TsNjFBFwNsZEu1LBQbUPrPqzSlq7im
 Fs21H2/r4gwLF7obG3Tp9Q00vjoo5rnA0LL2wtlyh0GL5RALL+56RMhc8FgSamhNeKCOqhSLz+j
 ubs+B+oG4ST3zN/PPbtUaiWdZZqe0GVx0f2ZCE0/KvhMSZz6YfdnZDqLHYaEJ0VFws6TINTr27N
 SfQzH6R4JpEssvrfuf8OtQSQ3sWKnMVMwQnYOocfjadKEBr61RnV8NAM2vnvZ0r7NXQndFeQ7wQ
 9sIqj+s2awWNeqFyZvnfGIKQQhu7TIECbvR8pGOFei35+v8NS/jn27exWoC6G5cYZuCas5tJ21Z
 OtLCxj7QuQnQHYDxOFLUqWnom3x7JQ==
X-Proofpoint-ORIG-GUID: Je14Q6EpLW3Gncv4n49mmrxZISEYY06H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510020047
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

On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
> My current email will stop working soon. Update my email address to
> jesszhan0024@gmail.com
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

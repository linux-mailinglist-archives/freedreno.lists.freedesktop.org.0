Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF1AD358F
	for <lists+freedreno@lfdr.de>; Tue, 10 Jun 2025 14:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461F310E526;
	Tue, 10 Jun 2025 12:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+xFVZv4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA2810E529
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 12:05:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6bnu3000792
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 12:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h6vlCxhSQUvr82OIu6Fr1YYqY2ncYKV9HsLI2TKQjvA=; b=O+xFVZv4445XtnWy
 J+lVZ9O34FPA0XJVcZ11LUaUbsEPFvdYx7ianc2oPlQuCGwtmCY8BusCljtkalfF
 NVWP4JZbGRiwshmTnVHV0Op+WFJx6nyR3zBloNDJ47S/COpvvw3WyTo/2rHzlL2K
 COVLXIGiR2vHhi1HsmVPfphHtmfab0bXxrUbxCZDzvLUAerdbw9MAxLHtp6Qd/2G
 LODITej0WCU3gl6yT95aDB9W5oNNyn3uA/Z9F8l09LyU4eoLE2lsFWc+HkOUOJpo
 KC8oWvN3bpoStzyaXRmt30qM80N5AFAvp98+2v9wg3WLsVwKWsL42NXE46hoS67D
 VWIHoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tc1b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 12:05:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4a6f59d5ac6so8172701cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 05:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557146; x=1750161946;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h6vlCxhSQUvr82OIu6Fr1YYqY2ncYKV9HsLI2TKQjvA=;
 b=iROjhzrbYKen/Mg2vaCd/NgiRMpRz3vrFnbUDTuA2T4Q33IyT8iKTc1K0EPj2X2866
 4kwm30S27Pt+v6xvg7dOjQ+xBmXi9c2w8uDifgWbJCWBLxgiFm+MIVVfoDT/mCby77n9
 AsZnrmWegrGajobbKPVU8gbX7tV18jG0DzdjYLi42IFD8L3iIyGmeGJz6fsbDAcZkAD4
 jUY7xixB1ud9m2GMJ4m7Jm0klcciLU4meyHm7WEayivvt9EKDDZnpDk8QAcMN38G+qIN
 y9L+OeLUO5Hbhz4V5uMSaH9kMRRhYgjNCEm+fTAGSa9n76F4Fxrt1pIsb+UDar61ayWu
 oNXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXutVOeyGZ83FJGBKXT9G/CrNUy4LcYJq6prHNvfZFyFfibz2CWhPoBMFbkQRDPJB/IK8v3kkTlWl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDzA14umLLBTh2FNol/XvOfACsdZm9Uj0U6Xj6CdZB8VghDm8N
 HDons1VkN65+BI/Mfx82JcfSFDFf+DOERx+3HjwjyHr+/bvWkmZyZl7Qf8wAvzA8DxvqQVd4Y8K
 jiW7DWUOebR3G6DEstM8mls2gOLHWPp7ojmsndZXoYf2+bV70D5rCYzNWrjsya+dqsZYS9Gc=
X-Gm-Gg: ASbGnctr/uYDbU51/cgmRZiiLIJ+TpicaYMORhZZ8HgkSPriTSQnmEGHJqanYszzmXh
 vRZqANlmRkwadalH4sLKvaaF7QdJvPraP44XrWLtBuW6qTPhH7X34RqFKi7bUSshUqC9IllY/oR
 iGByvrnTXXlyn4ZKZAhoT2D8V7BI3VkEJPmFzYfIvhPm2ABj1/3Wusuv/J9dgmM6JAZgrAos697
 lwojg8CnPkCab9PdAs5buVUpR1eH5MvtSFkIsvp2S2CUQGH+Ji9AfxEO5buoeDVCHsOWkTssXf5
 Z3iXoi/tsIGmJm08FqM6OZULQQXEVYXcdpDB+PYAXmIKiwCZqjd2VF3C3LoDRT4SdCWXodcFAah
 r
X-Received: by 2002:a05:620a:4496:b0:7c0:bc63:7b73 with SMTP id
 af79cd13be357-7d33df22c1emr912842185a.13.1749557146339; 
 Tue, 10 Jun 2025 05:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy7jnQNdMKK3VoKnfpEBwRY1V91000OKDc59hXFCGtzyBYzwQtBOpr+Q1wE5lNHQT7AGzK+w==
X-Received: by 2002:a05:620a:4496:b0:7c0:bc63:7b73 with SMTP id
 af79cd13be357-7d33df22c1emr912839585a.13.1749557145775; 
 Tue, 10 Jun 2025 05:05:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d5f9b37sm710722766b.0.2025.06.10.05.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 05:05:45 -0700 (PDT)
Message-ID: <829d79af-cd66-4124-98af-7819d9476840@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wYjzRyPmMhgUyMByoNdVJICJIAmOxvzv
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=68481f9b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wYjzRyPmMhgUyMByoNdVJICJIAmOxvzv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NCBTYWx0ZWRfXy+4F/2ME3WlD
 oAXjD3DtJkwWm80MwnBdnZfTnkd6PXDASBkqFziCmBiki7yICxBv8SHPqu4AUANeEnUC0O5rKQ5
 B0p3kJ9byKvIP/59CDljKroYalbk42+EKN8W9TOBT2/aO9jj3cMj49pTYmXoskwdp8v4+W2Vpja
 bV6vL9aqTpDfn1eWFKXo/5ahBXfzE/TjjbOkn1r0QLiyhiIFGmtmSVpKUsMiOb54M9S20BPIJGW
 p+L4JdgQTEUUCZtvmlesuRhM10G9oK4Oz833v64m/MOtrUBILq93pj6fZc36agDetyNdsCNffbD
 1wkil7ztA9MsGR4uV0enNWIdEfECox77nI2e1APPp6oy7tpgbP4P+bYtTFwil65yjzb0ZZ48ZVt
 IY9nR4iLuK6aj1nCO+t76tfwR7dpPk0Wms2sxLqhnAAbSwfQ9K+ELUn1ST9PmE69OVvCgQdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=794 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100094
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

On 6/9/25 8:24 PM, Rob Clark wrote:
> We are going to want to re-use this before the component is bound, when
> we don't yet have the device pointer (but we do have the of node).
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

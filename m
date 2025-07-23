Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2EEB0F408
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 15:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C25610E7D1;
	Wed, 23 Jul 2025 13:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="be3mm9vp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8013610E557
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:32:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N989jb004853
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2bXOg94c4P77UMYH5aBqkxUK
 tX2QBEA8geY9+BQ+StE=; b=be3mm9vpNkezVmc8tMKVcODyOi3UfenRTm5h4kQg
 ygWE3bABfpQXTgd9j0w6gtG1LyArH8eD8pd4aAvnHySUx9oLo4Q0ZYKL0Urxcsvq
 AUxljNzdFSHR+yIzXGDuLGXnCy0HNdBbS+W9UB05UmNJtLuaY9cQPDwWsWacuHEg
 XndOkKjsh1dPYaueT+0Cf2o7fifnc7P9SgaO2Q37sbvljVqeBfTAK3OwJW1voSCL
 cqeDHTsiX7pQfKqdMkNzkdW5c2QLU1TSrSwEa9VbI3YdLp2j/0gPK7FAtzZ4KWYu
 w+iqw+G2XQ/B7GBuB6+kwAhCxGG6klrbh/OZNw3pbgNlGA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w6dy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:32:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e2c8137662so1227206285a.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 06:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753277545; x=1753882345;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2bXOg94c4P77UMYH5aBqkxUKtX2QBEA8geY9+BQ+StE=;
 b=FA2yRDy1yUbZkPwGdiGB3iesHgpblYHJlWXe4bvhSZIKVGSV6YYB+sFOKfdN6t+l6A
 vBXPjOSHOL4tveAEJhOJnJhmGxTYs6TrSUuicMKOp5bOhYbPQpIw/3Hl7yCF9KVrSvf/
 V9OKap6TsbUVksP0JNSAmqLZNMbotDgkAqxJy1hryqaOSy4VrvTOF+gMDSRO+9vE/jod
 DWjVTRrwFSB7uzDpWIIHoy6reu+PVHdD4qLj0uNQphn277ejdNeogwcRI1rQ8ev4W6N1
 JttFE5OzxhvJjOPWEbZJKivRXbx9Ah+DcArMjjJUheNuBQezs4GE9beJsMtsqBg+tRbi
 8KFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG26KSG4rXtE9XucCYYKEIZAaFDDPpOcUudMEcSp06POrls3cfZe+gFKQFLQOTspmQ39G5z2zKw8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzonD/OlgLb4MQiiQfmtfyFE5gtdaHC/LUuQUT3YCOoM9YtJWL3
 JIAH8j7eCHX8ISPkw5AxS/wXIV+i9zycT9TvBNGXH15/F2OKCYOT8x1EFX+Zti/MIqUnr72rSjy
 BRPjvKOyufsL2GgYY4UtrZ0l/Lrdbf0+Pi274oz02s+zGm7dga1qXmavZQ/qtTAyjCIQreN4=
X-Gm-Gg: ASbGncttqZOfhmMMuPIa+TqziyiDVNyQRiRwXxAdIGsmfC/r9LcgCMktM0+waatge2W
 gMXOHddFzuWhaptALm9A8iACfGjoUaHhC3egsgWxX82j+VGbarSqedsuGuOAYfDKn0Ml/SNk+Y5
 +Jr9B9vudqN/fvYh+T+QewApXyrWrb1O035wIsjc7OpTYxBuumaWNws883MlrkN53DWd3JLqRR/
 qFlAwqcqdtnRiKv0pdFCALDFeCorgxWG14TCj/Spv1J+EsdCuydZxvzbbdUEQld2fW+CKsLpNo5
 MedGKchKzHI6oNTttA9ysOo8uERDJXsWfkv1QQgk2jnlVUcMU+43MixUkltyxJBGAzFIxsZxhCH
 Ejc3a1Mdw09XLjHAoR7rrMw9QikYMpuklk+GIQ8ZHPcbJL1LquCrN
X-Received: by 2002:a05:620a:8326:b0:7e3:2cad:a101 with SMTP id
 af79cd13be357-7e62a0e49e2mr333553285a.16.1753277544207; 
 Wed, 23 Jul 2025 06:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEydExjA33+4H64rlfK+rJ8J7FY2kUP7yS6AWx/bNwbVHySO1mJ19QUA1ra95IE7X5gFHrmMg==
X-Received: by 2002:a05:620a:8326:b0:7e3:2cad:a101 with SMTP id
 af79cd13be357-7e62a0e49e2mr333549885a.16.1753277543623; 
 Wed, 23 Jul 2025 06:32:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91eb927sm19151641fa.90.2025.07.23.06.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 06:32:22 -0700 (PDT)
Date: Wed, 23 Jul 2025 16:32:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: ubwc: provide no-UBWC configuration
Message-ID: <bex5yk2trx4ko2ibg6oa4dm7rcud4wypznjsielf2rc6vogss3@m3rle4rp4c4v>
References: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
 <242d4174-d01d-4a65-a4a6-1f4d4e2d4fa7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <242d4174-d01d-4a65-a4a6-1f4d4e2d4fa7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=6880e46a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=xD5xa0Ad2uggg-ClYCsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfX4EbhazEZUfUC
 E1JuhbZNA0Llra5KZjLaLHEyTyjge5Vw9DBroBRA2ksHN+1lNHDWBPn8SfAvWJGwrCUvPDg+k59
 k1UeyTsTvNaKo+egZSHNdWE5qFJRjs0WsnBApYGwY8JD4avoBvpihxcRHliaImnMlRyra27Iuex
 lLddbmkQ9H1iA6kT8tDqyy63bPPgIU7GV8cyfsLwHxcOmZay6Cq8noUR8P7UTvuRpQNkNIZm7nT
 DvhpBwYnKMokulqKQ7f8nMvN1ThUAoWle3PCZRmCK6tkxJh856vPRbc7LbEM2I1D4GayGBBd6on
 OnJPRr/DZIJEXoI5nz6cCe20D+2sxiKvGp9lnrpGk0ZXBfIczfdgnElQS1tHcKTRsm1HULpobr+
 FF2seqJs4ET2/YJiIlAqrWqXMA/JbwCyDthtJL3p+7W6ASltXTRxxyz36Tv7HgYp18PEHOsY
X-Proofpoint-ORIG-GUID: uMP8Mi7xDP1vrUYouN9prEdkVD7UTu8H
X-Proofpoint-GUID: uMP8Mi7xDP1vrUYouN9prEdkVD7UTu8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=790 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230116
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

On Wed, Jul 23, 2025 at 03:26:51PM +0200, Konrad Dybcio wrote:
> On 7/23/25 3:23 PM, Dmitry Baryshkov wrote:
> > After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> > database") the MDSS driver errors out if UBWC database didn't provide it
> > with the UBWC configuration. Make UBWC database return zero data for
> > MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> > 
> > Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

And I forgot to pick reviews for v1... I'll repost it with all R-B
tags...

> 
> Konrad

-- 
With best wishes
Dmitry

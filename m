Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F9A6CDA0
	for <lists+freedreno@lfdr.de>; Sun, 23 Mar 2025 02:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2C510E176;
	Sun, 23 Mar 2025 01:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuJBJc/p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C872210E1AD
 for <freedreno@lists.freedesktop.org>; Sun, 23 Mar 2025 01:18:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52MMOhW4002095
 for <freedreno@lists.freedesktop.org>; Sun, 23 Mar 2025 01:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2R9ezOTp2OXuwq2T5MuT2vKZ
 RZJiv8BpmQQIAHvkRRo=; b=fuJBJc/p1pME36ADkN25DN8/FvUuW4LGyR0BJfGw
 LkfBleFjuQmWhD3r/zLQxhZevo4KIET1dD+C2qwlXWstLq60ZJZe1UcKDJIq43L3
 CbzhVWK8TZ8GFc0blvX23vdn1TKDHrcS7vkFjFiw5H8mO7VlstReT98uuc+nBpJi
 xjoytF7/xSAbzpfbBlsjpvvIrZoK6zyJYbZivwCcOmxoSPCIXag7aj3djHnuS6IA
 GNHuEJ7oZVXqxDF68QuzHldLNY8Tx7cWhb4EjGuO2lbqa+xbjdioZdfGU/bvRc6U
 BgdttTafXS3rzpFRgTL+wxNRTAok9q0/ier+QJvHf1GFiQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnk8hcq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 23 Mar 2025 01:18:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-476664bffbeso53280161cf.3
 for <freedreno@lists.freedesktop.org>; Sat, 22 Mar 2025 18:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742692716; x=1743297516;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2R9ezOTp2OXuwq2T5MuT2vKZRZJiv8BpmQQIAHvkRRo=;
 b=v+x9tHKm6+1Kw5jqXOZJ4xDEQlcvqKSjFRm+t8o2NiNUQt/Ij2JXIM83MnAfqaxAnk
 OlddF48ihsM1kgUzhw4mmUIjCGhsVjiVDOwoFsz1JqgQUI447g1d/2HzefSvWee8pRPj
 l5yPYoATj2DACmHIf8fTtLubzb8cQTJoe4xxmDCEiIgcbD5SKfjP6nJmTq3mMTKin0o3
 DBWf2yxmJ29kcSUEs/oAcCdfHQr9y5XO+EVbJz7XQ5xi8jcqYBa1cEaLnS+EjPS8MHIq
 64n7kC2lgQiA6cZylnu0H9rJgpBucSzKb1xsdii0L/fqKhhhGWaRNTZ4qNmSX+ouCJ0I
 35AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTj/8KTfB8XiPm1Iy18FXFsFOlV+KntHgtv9w3ffV9tw1Nfol81xjMN5tD9tGp+VbOaw8Z7U1k5Cc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyiac2DQzhpFXuDF5R9Z7WP7QUwJTno0dcjlQ/AxMnvtohIpUch
 wG21pzJtLV/Wgk4dnM+IXodXUZT8FwUmfcXgzwYTU6YQ6/RC5jAzx6uWOqSW2cdtwl5n5VtCNYP
 w7UyLr8QTLWAbnugE6PqUYZM+aR9Yyr/I8zNdyqQbSZXlUn2zhSs7THF1sMO3m7CrpBU=
X-Gm-Gg: ASbGncv923RWrD2PLKOOch4UU8TeJNTD4yYeMw11HyGpUaMvSPS+1Z6WApL3hgv5FFm
 fwTQKkCcTE+yvpsP5P2CgcGdjkSqv1K2PFT71iawsLqcyIHgoYtQmOE5uoLZUHf1Gt2uY/GulN1
 7yyEZDTnZ81UJ1Q74d8gQTj59C1z4klazu1LXN3bPPMfnWV1Qmgi1oFep+g1Rc2YK8N+6P20IZk
 4oc0y97SQl159ffpAgy0qp6EraZ7em0MzBZbkbv7/RtPhM6bDbL4NaU0c9QVgmVXgjdjhPmxfZ6
 Y0+5nj274n5BVhhujkehOc1+bFyKeZaXSvtxPhF4r65i1ulysxzRmN/4F4qGOpAYYDbsn952au0
 CTuY=
X-Received: by 2002:a05:622a:906:b0:476:a655:c4a2 with SMTP id
 d75a77b69052e-4771dd922e7mr125176651cf.22.1742692716017; 
 Sat, 22 Mar 2025 18:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0/WAUbrypxHSD2MRLn7a/ohpYmGZD79AJWPxjbyAjULl0qmwkDIxxDUHGu7wO7VnkZgiMmw==
X-Received: by 2002:a05:622a:906:b0:476:a655:c4a2 with SMTP id
 d75a77b69052e-4771dd922e7mr125176401cf.22.1742692715594; 
 Sat, 22 Mar 2025 18:18:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad64685besm635531e87.33.2025.03.22.18.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Mar 2025 18:18:34 -0700 (PDT)
Date: Sun, 23 Mar 2025 03:18:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Drop fictional address_space_size
Message-ID: <tih7arhudjn2sotdvjddzncqi7nyx3xgsvnfi472ve7xcwhhqd@2nlrtoyymkfj>
References: <20250321185437.5890-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321185437.5890-1-robdclark@gmail.com>
X-Proofpoint-ORIG-GUID: 4hLcd70YDyCz8JiC3AEXfdEgTLH76PN9
X-Authority-Analysis: v=2.4 cv=KMlaDEFo c=1 sm=1 tr=0 ts=67df616c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=qQjcqu3RhaNh0RZ1ZdMA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 4hLcd70YDyCz8JiC3AEXfdEgTLH76PN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-22_10,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=822
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503230009
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

On Fri, Mar 21, 2025 at 11:54:37AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Really the only purpose of this was to limit the address space size to
> 4GB to avoid 32b rollover problems in 64b pointer math in older sqe fw.
> So replace the address_space_size with a quirk limiting the address
> space to 4GB.  In all other cases, use the SMMU input address size (IAS)
> to determine the address space size.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 33 +++++++++++------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 19 ++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  2 +-
>  3 files changed, 33 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

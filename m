Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A5AC2802
	for <lists+freedreno@lfdr.de>; Fri, 23 May 2025 19:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983E310E058;
	Fri, 23 May 2025 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RodJLXA7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3FE10E0A8
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 17:00:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NE8IJt027636
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=maOR1rPHKMjhU6q4YVbFSzEd
 jGLm86V7mh+z2Dssfhk=; b=RodJLXA7sxKKqUjE7fZ1XL8GGX5MZDuJodF3bNjV
 +hBLj/uhAA9Aaxbc7VEGvBPlHkRTYN8TpgwfDdMGgYu+9syM/t4JerfrgxDosajl
 VHJkJaGGS848/wrQjLJarXprVSKC/8Fn4F81gViF192SAP/+juDbU9jCt4cZvRVC
 to6DXaz2FK9PoVNmY9k16l74amWNEK1N3OlH6x+Th+IQL1U4ac9a6+sQCRahNh7b
 tVoTtayd2cj+QgZhRFrXnXwlAByXS7VDe66fk3fCR/1os6m4QMc/QdPfQaGN0ZX/
 u+wWy/xpMkh2TH5CoUVn7C6edA6obfN3CA3q40EC2UMlMQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9jheu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 17:00:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8cb4b1861so728706d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 10:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748019604; x=1748624404;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=maOR1rPHKMjhU6q4YVbFSzEdjGLm86V7mh+z2Dssfhk=;
 b=uhPcUOzlhHxlKEn+fQrx83ZM+o+Hz31BxQVbXC3J2YbXZBd+8VSU1iIZnFbyK0P/im
 C28VVVUn2Xeu9zC6sUGM7cP8stZTPnfN7v/cW8venIcWRzbtAX5/Uh0IRVQYJf8UTvs8
 42JsC5bEdT1vPAONxGF5csMlSDGpC6BN+Aip3tfXwnBQ0wvtTo2ddw0t5LbdIkvXwV+8
 O3aDKVmdWl0Slo55GOBxj+MSj86RJiSZ6nunffa+SBoTLfHjBZ7Tq+CMb0PxkTRaolIR
 Rgw+z6U31N+uKZURw6cHJw6YeS1H8cf9eqJpRlIG2rtaCIhPvCshiSkTMjw88a8f6fXB
 7N8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjBVP4UUcvQDGFPBusj783bw4rAcokNVd3b51NNiJjEJ3f1Ulm9xN1yTxDDfBs2alGD8PST8aWV8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIV4Sqpq7vd9i/C1BOn56v/cawqe+sA1KO0Ar+6BCqo4785ObP
 1kMXMqmIvNey8iHxGZkVFMJf7fznLu4GHB0zCsacJmKL+OOlrJ4nHM1/8Af5oIZ/dVjJYEPN/iw
 Fvschx7eYWLWD/I5Xi9fb0cyUR3M7bMwX8WGg88W1uG+RkEWhHXdf9q3PFDJVvKH4m0hnZXE=
X-Gm-Gg: ASbGncusev4XOV+dan+cZ8hVi1+6Rc79+eoDK82iwc3WfI++5FwS+fh+DcbaBv+WQW9
 94+V9DtdWdtQ/S4Gjv2p8xd3lbPSb7U4+HePoCLQ1CvXcGO1qXHWKZcUMvX6DK6aUwHD9QCTTMI
 dnAVFXr6/ZYeLtowkJFnaWt4BrIcibAjjl8G2UTUL6QPtPjNdsJDCtevNOmOF9c/gXNtbLIYVSh
 73gBzUqnILo0xklBq6sL8OHn67liG+PjlumQ6FcUtsTTebUBq4aK4mezjRd8cI+8HKSJiQZxuW6
 +u2ord4//vz49oxLwc4pyi9ix5H2M/z2jsPZKu2CXcT/qj9tp+TQE3eF8ubWBEL6WBx6nKC84kQ
 =
X-Received: by 2002:a05:6214:2025:b0:6f5:4079:3189 with SMTP id
 6a1803df08f44-6fa9cff2ef4mr5010186d6.2.1748019604268; 
 Fri, 23 May 2025 10:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCYdw0GZtJvLCfXO1X8zZftyGhiXHFblI6F3g2GPsnCAihhW1dYilfd6/MVO03PSiywr0fMA==
X-Received: by 2002:a05:6214:2025:b0:6f5:4079:3189 with SMTP id
 6a1803df08f44-6fa9cff2ef4mr5009886d6.2.1748019603916; 
 Fri, 23 May 2025 10:00:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f3666fsm3935508e87.104.2025.05.23.10.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 10:00:03 -0700 (PDT)
Date: Fri, 23 May 2025 20:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: msm: registers: improve reproducibility
Message-ID: <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
References: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Fg6YZdIibX-Fc7kojuhHc6zCSK-2PdwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1NSBTYWx0ZWRfX8RcN41i1IveD
 7atqiHPZPLDVmkyM3akYEBzpiZI6TPTQjlCOJS5XxiEA5gpsBCBHxnO5thXWNF5GOQiHjW2JmMM
 sXq0IDxDsxZ9EcuV7TxzC43jb5UWSW1cWStW3DOZnI2V6qlRZQuj63MrfUo9/V/p9NQ86SIUbkp
 3IlbvEUIOk01vQ7m9eKrDiHIzUdAMqqVYnIwLwffHMo4cRvVqVuysgsO9oh+xHbVV5KP1lVcWBL
 rNrGv0u65dIRIUieb1+ZwF0nSPVKQdSx9/1zarGqAc7NmuJQFyTKRlRU7QofrHGpmgnLL604Wes
 y9DrbmQYBKU+be14VGki2nTsda/Wgscad1RCTlgwlrDqd9kHwaM1NP7DIi318GmLwFl0NU4iORQ
 VqSUxiGP3WauXuBz8241OTBAGp+5dRlQVQtwKgs4LwJNIyPoXCkwRpaoQSvBLIpHYMe1hqW8
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=6830a995 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=dkGs_W1-f6rb9hiwgxYA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Fg6YZdIibX-Fc7kojuhHc6zCSK-2PdwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=366 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230155
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

On Fri, May 23, 2025 at 06:36:16PM +0530, Viswanath Kraleti wrote:
> The files generated by gen_header.py capture the source path to the
> input files and the date.  While that can be informative, it varies

You are not the author of this patch. Why did you drop authorshop
information when picking it up and resending?

> based on where and when the kernel was built as the full path is
> captured.
> 
> Since all of the files that this tool is run on is under the drivers
> directory, this modifies the application to strip all of the path before
> drivers.  Additionally it prints <stripped> instead of the date.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>

-- 
With best wishes
Dmitry

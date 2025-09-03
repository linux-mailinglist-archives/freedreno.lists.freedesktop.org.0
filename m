Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9094FB41A11
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 11:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EC410E65A;
	Wed,  3 Sep 2025 09:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQebEawf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0CE10E65A
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 09:31:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832E1IK001375
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 09:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R11J2ZPvgur12OjpaY/ZBN77+0uB5Jyxu+Du4WBbtJU=; b=nQebEawfeJJnuXoR
 oYb9e0BDMX88zWnTCjsF7RF6K4CiWoG0eQaks94P1AOzf62xoxfRioKg//b8fT9X
 fP+cikewvFXxRHKyqCKbk6k9DsvyB/DbI679LULgbnnA5SDlCQvQxR2ywD+EtRFv
 dfdRvo4+psm8oJqYiISEjExTEU2olybDvUQT+EkvatX1rAakhNK+aFUDlaHAxqgS
 eGnySm59KpzSp98H9OMWwvs9kKvidnq3ZHMIMTDmWxRZzcTh7+XO4FilZw08cXEe
 g2sPvJq5lY6Q3oxlKed6nJ5bG8voYlnRsi/0MOfmZ5IaHVbDBalkp7eeI2Cv6uBU
 BBhlYQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy6w8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 09:31:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-726a649957dso1650806d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 02:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756891889; x=1757496689;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R11J2ZPvgur12OjpaY/ZBN77+0uB5Jyxu+Du4WBbtJU=;
 b=Da0yaI7Sph7Sa5xjQeHAQpnd5XTkbNeOjnZGEjz/X5kkZ59KyJARUIsKGcJSopHt/8
 iNXXYhnXBJdcPbVL/Z7saDvjvN90jgffcaLoib2171WBYRd7Qj4VFXhcz3bkHSBhlaPJ
 7OqVyzMDkbDIurqZ+STzs3jGeohWzQcUY7+ss+siP74uZwA5wcwybDH+H3x5T7OnS9fN
 k9WMsiJAiit5stkCzolJZCoaCVLGWtyqx8vR/0DQfNaSXNKsF5QykUvQWB4pJzHkUYcv
 1CqhTncThhA38QzZtG+XUkMX7agyHDSMwn9KauVqq6/0scN0SEujofHJ0vklzWEWYJNG
 VDOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJnbjiEO9plJ+jkdWtcgCPo2yqKxVrU5vbKGh3TpV714lo9WXN289GekR6Vf9AWlDVaOdKtw6kt38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTh5UAJafQjvLtpvnbVz7bX6Hr9+0tmuVh1HuPxlUHAJDZlGuw
 /5neUsE5R5RbOdO7uosPM74CE27k8mYOV4Wb8bT4EuiMyrCQVsbz4vR4BnyjtmVUPJvFkWoLf7w
 Xk0yER5Q5z/VGNWTR2b5jKd/+hibAWFNriLK1YNwQvW90iPgeD80ymB6L8Py6LAwoM5XjdyR4Hq
 XwOEU=
X-Gm-Gg: ASbGncvQWvSk/tRVkyx5lfbt8qMDXK51nB/lnyXa6oH1LvgHSuPJHn9zsaYVv1hVx3t
 sgV7Zes4xwassLJJQ0a+OJlj5bXHrzbdoS9KXGKbuBx7qPPR9A4q+5qvHLhyhGM7Vo+TRhhlQlY
 8Ai1qwNBxkuPodOubFcvxFUXtjFSTOmuR/8ZhUs5zSAUZzQ7v4YxfFZJbAQ6wCaZs6pBMTFy9Pq
 rS4dWTI+GeGNemOzqWUVr2eXJn2Xs9GA1DObuOiOPAGyFiQGlIftOzJun5m348o656Ookn1HVQf
 FYh9s4eUeq7bBCcLcKiIIyYbDu7DS6DXfRVY3EIPuObGZn3YDJA6AU3ysDxVMPpY4093h8EXuBx
 1eBmA+irf5QwFAta+1nYV7qKOhiYG4NYbwdYex0pEydx9m4olbfoM
X-Received: by 2002:a05:6214:d87:b0:71e:d4f7:b43c with SMTP id
 6a1803df08f44-71ed4f7b6fbmr81039096d6.18.1756891889141; 
 Wed, 03 Sep 2025 02:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpn1OxrJPfcU6oHH4NoCR91bC/412PrDtsPmAKHu53l4V9VVcrDS9TC7zY3OUCJn7dGPO9ng==
X-Received: by 2002:a05:6214:d87:b0:71e:d4f7:b43c with SMTP id
 6a1803df08f44-71ed4f7b6fbmr81038866d6.18.1756891888652; 
 Wed, 03 Sep 2025 02:31:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50b0e98sm9071431fa.60.2025.09.03.02.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 02:31:26 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:31:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: Add GPU cooling
Message-ID: <tjdqt4pgagy52xncrqk7dkjjpsfqukjbthrgpddjatfkd3xd6g@7vglhah32f5x>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
 <20250903-a623-gpu-support-v5-4-5398585e2981@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903-a623-gpu-support-v5-4-5398585e2981@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b80af2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8h3n1EBGBd86Ebf8828A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gv7zB8gwJHqJOD1ve7R24Eyyq6S3PJl7
X-Proofpoint-ORIG-GUID: gv7zB8gwJHqJOD1ve7R24Eyyq6S3PJl7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX3Yig9Wf7vqzK
 /RmQWU8Bt8vGYq4KSCCk/Vy+6VvooUBAx3fU5zCs1H2rV2kfPmA618b//yGGCuWixzCpKfRrxtD
 K9jj0r4gAs3D9k+y2X8Weoxl/qmgEOeY5kNnUizxW8IKgDf9/nf59pToOUa02YlJhCgP22sOFkS
 Rzi5OJTgJbls4lgUVdzY4jWj2DPupcRc3Q95Wu8Qnpun0ZR4G7+alPxXBugsMCwijN1/bCdxpm8
 8zoM4ksOpDoAY9z06JbQ0JLw8e+SV+L2hc1xotQPkN3EwhB853w48Yb74O2UbkdESiRN4pRYiGv
 KyoAdErtq7+U9//q8t603ZGW3IpGBCAreiSrsr1V8IUUjKlLBsANs+dixdmYwqb3uztLNNUKMoQ
 uxlDroP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

On Wed, Sep 03, 2025 at 12:49:55PM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 115°C.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

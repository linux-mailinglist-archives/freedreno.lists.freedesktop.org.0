Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E3B54CAA
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 14:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5B810EC27;
	Fri, 12 Sep 2025 12:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6BIixRY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41FC10EC34
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fD4A018554
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NnyrkzB4u18LRqNkoWf0ndPR
 ZH6XykQ2rOusGiQJecA=; b=U6BIixRYSgDlGbrcDBKVqlzqS0Af7/HksXpssARb
 muet9XY088mhCTEqPh29mMbqImu6KpSkYJyT1M5W1PnfW5x0pyJ1xvO/ij2kaSij
 k7xs0/2yWBcoGM5nT+T0uV5hgcZP6sMqHhS1BS2b+6r7c9E3bUA/fYtOem2Cp5+W
 qv4IJzRS2bBURYLzjn0TdzSiy8E/VfkXj4l+gjCeugU8PJICmsV8ybck56LqVTes
 a2U74zfl5vjhG564d2Q0mF1nHmbB/OyAxLzeewXIVYtYN88dHS3RcNZpWhsLUUzQ
 YQjn7FJJzjznjTLVls6ig44K5RUMIuX/tMX96W3dDe/onw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8akjyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5f818eea9so37271881cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 05:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757679044; x=1758283844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NnyrkzB4u18LRqNkoWf0ndPRZH6XykQ2rOusGiQJecA=;
 b=SNwyf8BPERaMI5Yhv0gPyaf42nYU4uR/bO+FUrqN/A9ANF+U8miOxO1DiLZRz9WTU1
 WSLHKCeBIIhICVGuPFXqal0UyYoJPAEPdwyh2dzPwU62i4dPJmnTEFQK4G8y+KDUTTpT
 i4WAt400qC03m6iqk2glRVylpDBtwe1iIgd/lxvF3pvleNFyNasZhyKmIr5fu4Cza1Jw
 0/cV2d0SWSPlWlY4usCwNT2svOA5TTTRzy22Z3D0inhFXh1F06D8hrSqPFsy4U//qmGC
 euK0hA7a8Iy0IQST7c5StvfHLn3b769aqNorBE+SrGIhbRc1JAKqAQuCqUihpWO+0dCJ
 tXCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMrQ5+NvQlZzpbEMLToEu7BgHx0/Cgz39qq8YlOvcuhUDXgi+2kG59gB26K2r3d/aoe/kWpxcBiqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxrr56ozHxEogOpa8HzThR4KZMfYdsg6tWwHtm8ubfH0iPpRxhg
 2PDsYnKVsFVIi6rNdO+8Zk7Evc0RmVqUICJe+3tQIwUDbIp9dExDfdpWkOG/qSfor/e53svZ0mR
 697aObwMFps7i5YLk19N+f6xOswm+0Nlmy/BoJf3pVLZuic/KNKbLoWkvgvgPceQbgIgR6f4=
X-Gm-Gg: ASbGncsLMImyHEgpTFujErEBpiGWmQuMP4n1zo9sQn4D8we2zDDSFPFePHYT0n1iirD
 ei4QcbXFQCx5+9FldTIDceyc8k+rPvuBaI4tVfAuJBMFxULoeC3/r1+4cDWHXoIR8AMXGWTtAik
 2GpIPxHUBcLxIyqm3SaDZtj5zrp6SE6EzDW1MNxsOuEe01v6BUX6a0WI8VRpo0yalk5tWUBfhG7
 0j2dsDnq8HXFaRkauBDy3b0k4waoqW0I/cXnFYqzQ+K8T/Kbp3kaL+4UfF8puCSjwLWxU4ktSPe
 zaxd654wUgTomGSQJTjuOpbdtR7WkBHeu3SGJhWSG1iAuzQ/dl5w9Tju77b2FP7Mn5TfPSAwqPQ
 KnvjBcBL991yv3G7/lJtObyfQTw9Jss6R7NR4Whdpr0fbFM2OGind
X-Received: by 2002:a05:622a:a17:b0:4b3:4640:13f3 with SMTP id
 d75a77b69052e-4b77cf98445mr37106941cf.7.1757679043699; 
 Fri, 12 Sep 2025 05:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2hXwtWFU78DBNvsjwVtqD2w0onEhQqn5H+I5mFQLCVEOiGDGwbwcAr1yHapP4m9rqMpxtw==
X-Received: by 2002:a05:622a:a17:b0:4b3:4640:13f3 with SMTP id
 d75a77b69052e-4b77cf98445mr37106281cf.7.1757679043091; 
 Fri, 12 Sep 2025 05:10:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a32f66sm1080568e87.138.2025.09.12.05.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:10:42 -0700 (PDT)
Date: Fri, 12 Sep 2025 15:10:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c40dc5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AUIyt3r8poIyOMLCWoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: QtPnxdDCa7xSydzBF6dHy0dk3h7arKEC
X-Proofpoint-ORIG-GUID: QtPnxdDCa7xSydzBF6dHy0dk3h7arKEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX2LQftARnx9PX
 JIjcbqPcI3TFtReBTkaZe7kh2XVivUwrjQ6EIEt1h8y6+XeNUyEvriONeKZC6blTNVP2qL87aqx
 YvB1CHjHPqs+42fiNSosOxKBfm5cDa+foLE4uNaYRGEOM9kfgAScEghux1GEIEcmnkJm9J+1pqX
 YRbQGjqd4eUVyrgBXT77hv+6CODDPTT4rmDE25jBncan/a1ulZaQ7hxpQVxEeEQOI8QakiuKxNU
 Dx2UFauuCGCxTjeU4HdwrIJFFsZqLQkTQCz6hcpl/NDIq//nv5EiQaD+od6qDr7YBWkljAQDdRb
 rnaZ5KyOFqKMi6ZpUqfj3Siqg0PeI61VbcdxdcpytSVU5dEHFKAW8FfPL6fkCGKWW+RKHcEBFh4
 J+UIDhR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
> >> Add DisplayPort controller for Qualcomm SM6150 SoC.
> >> SM6150 shares the same configuration as SM8350, its hardware capabilities
> >> differ about HBR3. Explicitly listing it ensures clarity and avoids
> >> potential issues if SM8350 support evolves in the future.
> > The controller is exactly the same as the one present on SM8150. HBR3 is
> > a property of the PHY.
> 
> 
> Ok, will update commit msg.

Please red my response again. What does it says to you wrt bindings?


-- 
With best wishes
Dmitry

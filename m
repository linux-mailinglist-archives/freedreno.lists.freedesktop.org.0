Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C1A9BA22
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 23:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C04210E876;
	Thu, 24 Apr 2025 21:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5cOLPW8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5E110E876
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 21:48:55 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmpgw008490
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 21:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vJjKyI0rQI/9msOKqrosK9Bq
 uNXjcnMHw9Fb+7VsjdE=; b=P5cOLPW8tJRX6P/90ulOi4MeADMGmK9LLjAGy7y7
 0oI+UnDh0e4YfWrxqdBohtrb1TDHB3Kf7H9wFjHG/keMJFsWqfoji1fYIMikm4SW
 XZIbBw2qmwVHrVEcQfah8A5qEelf4WPPY4nSB5MygvuPs21BV+zU1JgR/TcXsJ8p
 Pxc1f1gNOXV2HBUxDOlEePVL27A9uo7kWMsRegqPEQ5EEy4i3bOVPkDwoqE4JREg
 zIwLyeLbBnXkmfH550nYhtvfrszE1pVGbjxNLvAHZkix6ZzUBJlQs6cQC5iVgZAn
 5kvTW6mQTaQ4T8Unwd+A5UgiKTfF0y42gh097fPsfl58XA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3pxg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 21:48:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c0a3ff7e81so263343685a.3
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 14:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745531334; x=1746136134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJjKyI0rQI/9msOKqrosK9BquNXjcnMHw9Fb+7VsjdE=;
 b=u2U7xWOSJm/5JsgEs7MouokN1Yb97rD+UlWsEuW+tzRRz0ahTlwS2IUFt/lEYwd66S
 gbGWzQRKZzRhnyu6YC/j5r5kNbEZPhVHy/UuZLZ8XJona2EACL2NDZ6+lNjdHSDkZqyx
 zeEnWLSEmCQcpusbnRKpBrtWDYWEfct2o2inl1UyaYi/iwQhj6bAkyfMsTqOK944etz7
 5p+DFosQSrC6hFWZGqbfm+ggBs0PHy0LEF+VA3nhExpWmmdf9hgBblwbTryuAX1ICejf
 fktwbjsGN8G1DKD/febRiMegKUQ2nx0TNRIL/mKRjIBAlAyVRuEh12xHHbG27O74+TIH
 HuOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnyJI0biqwdrAgeGAf+mL+Y/57M0icLLOQfAUwtOn4+EkkDCqnV5yA3IUaAcAUTI7RFdrM3DoJtQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz21RXjdpGSd4elNwLpNABuu39acvO8V+Q4fJlhIYAwjkD3VGmy
 +2zv6tI2adSeLq6R3tKWfeM14DDja+wQ3zD7qfwIp/Sq5gj0DdBjG6XW2vpikZp1TDqC0Ti/qCU
 0KZtIUqm39IoSwJIR4bLARLWS9YTjzZWXTczIUcOQ2X+CZ1cFyrCWsj337ZKdYXrflZo=
X-Gm-Gg: ASbGncv1mAkrgjgy/8KDtni/uRJRgzVB/gTGdYsQf22VUugjp7S0c7yN1fBzcxpl1a4
 ZC9R0UMeNEU8bChQ0vh3ns8cZd0PPdRzbmiENz75XzNSmD4Qm08fS98s1hJyZBs1V8cOFppGMQ3
 I50pvuwknw1e0rVedX1pNfAopYZXxl8aADr1nsIZwT2FbEfDqq/hudFfHb4YvA+8QiORulh/Ja1
 jlzkNX+l94JWPz2Or1/hX3IpYFK3BLAwIaPW5AcLK2EPSN5LVPHOSWSkA+AXfuQ5ohakUSGyXS4
 rBi8H7wAOGoVsOIl9BT0bZTzAjzcDMlX2OAaKSVI5CtfdIeII5Joc2deRgTj7Pd+cXQUYAeDBmA
 =
X-Received: by 2002:a05:620a:2a11:b0:7c7:aed7:907b with SMTP id
 af79cd13be357-7c9607d2caamr24641985a.54.1745531333783; 
 Thu, 24 Apr 2025 14:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0qarO4qVaIHzjVmmbkwRDLZaton6bL+gzlVk0PfxAhAHsQF6WlByLxtZIfk0z6pubJzUsMQ==
X-Received: by 2002:a05:620a:2a11:b0:7c7:aed7:907b with SMTP id
 af79cd13be357-7c9607d2caamr24639485a.54.1745531333520; 
 Thu, 24 Apr 2025 14:48:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cca7fbbsm364985e87.159.2025.04.24.14.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 14:48:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 00:48:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 1/4] drm/msm/dp: Fix support of LTTPR initialization
Message-ID: <num3gu5gfpnu3hw7ofk5ado2hnmftgqw3jfzlp4pi4yganugvu@ntsyr6lwry7v>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-2-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-2-alex.vinarskis@gmail.com>
X-Proofpoint-ORIG-GUID: iLJnG35TuGkxBZbptkQED_mVr_W5PtUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE1MyBTYWx0ZWRfXyUBFSSsU8ixE
 L9ADLj5bngt2NszGh8FekZ+PPaZiTvxPop4Qf4BgEE01ZUcOkv0hVZBua8pLO8OCjhCTFnJ8Fiv
 0FYlxg+l+5wPJU/EJjDXUtwMksoLJ7BAaZ6kOQn/SJZgIoCrRSTWBaNcriqwwnkO9ChNCxCBkgQ
 ZrFkf3X7ieEsHGOtu9RlrLlPAt4WgFb17c8X8tjr2LAxftsL8fSpEADJ7gRuSE8MIhohlaKsGQY
 Bsr3woaxFBfmapeSRudXEXcMCC0nlVznqPy1w/UwGqyJQ58CvosaPJnsdEgYfqyXOtAvaIYgLwv
 s8QwobYaObPsbfKZGP5mqgRaHL97H/arEjtnDLZWTFZ1T9J9NUC52InmeStMVPalXI1ltLg7yzF
 pTNHN7sllAq+JXq+XlBgN7yjPgQvEiduKEXSKQC/PaXgxyXLN33otv9HLQKPOiSuYweK6TBo
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680ab1c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7ctMvB4_1dO5SEtod34A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: iLJnG35TuGkxBZbptkQED_mVr_W5PtUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=988 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240153
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

On Thu, Apr 17, 2025 at 04:10:32AM +0200, Aleksandrs Vinarskis wrote:
> Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> Section 3.6.7.6.1.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320ACDBCAE
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 10:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B8710E9A6;
	Wed, 24 Dec 2025 09:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqQvfRUs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbzwHeOx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E78F10E9A6
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO17SE21597720
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q7FHghTX3uiDklouV4gc1+N9CvHPdPtpOY8FSlSz+qQ=; b=XqQvfRUsIhTVgRB8
 j3FMZpBxGMm8um0aRY+tQdnRSQKoj5/ihDN1vQR4Vvz70YWnfzXBFS/RzWHcWV75
 21Y1w60Jo1mcsW0yxa1UoHWeLz+tEr1La/tHrWq3YlX8RuOvMwgquwyZ5u/JLmPR
 TTYGZhOLxZrESw7ksblUWomzqdEmohr+5EQtHr29Tk3UU2D1Wq+8XxSevJsbPzNz
 kWRJzv8w+fDPV4JVtAPtZIBxrQW1ajpVG6dG2Okfot4sLhWdGayiI6k3OMrrh5/U
 043s+PL32KRK0BBBijtnkVwphN6yvWuUersPZ931d7VsyRaPQdsZ0XVONSAbL7VI
 5FCZNA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h5sr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a2cff375bso124021736d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766568475; x=1767173275;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7FHghTX3uiDklouV4gc1+N9CvHPdPtpOY8FSlSz+qQ=;
 b=JbzwHeOx1/i089hDjDRgM73a6KEXkfZDmH1FUMhLJzi+a0YyxXCISeBqvI7mK+9S9U
 K7RZ8B6m/10OoPLohNx5pExr1uE8GSWaQ3oRqG3cAlKvZ4s8rXSWfHt2FqruvaqMzg9y
 QZzcrMe/4teuNc3Jaw/5a48MMEHwZEjOT5jthf27caMV5u6xTrEvmVJ6CwUsJr/0HMjh
 XTzMt+y9tZ38Igg4B39ws7JjHNIdizdAk+n7/AEIc4lVls7YzsbSdCzPeQ0K5GwcNYjM
 ZBT1ue7aXSFgZ+5NOySzrwRUmDzrYrKwFzS9klHFPYEflfgm7shAEIlOFlSqjeHWH317
 XJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766568475; x=1767173275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q7FHghTX3uiDklouV4gc1+N9CvHPdPtpOY8FSlSz+qQ=;
 b=cQDSLX5VHh/sjr3hWtc2zmh/SVkD0Ufce4rQmm1BwzFSpj34hQITnHpdLc9Xf+CZAZ
 rz+3HdU6P869mrWWggiARLWVzlef1rJGVviFPbbjLWq9VPAO8YDOeHAygOysdbPYXhHM
 DUTC94okK7KK5pgZm62XXzcKw9dKxXLSoc1wtnkzwB1+T4ajpTZZT932/rPO1hoVEytL
 MBSEeHJgmvCCdM4echfn1Bc2t9e8hHbFXeBuh+xtZ3yiiDLtWrNHmb52CsGnVyPIHOwv
 WZF0BGW7oe9An5vCXjlGtv0YFlmzVNeJ7WVSUAuJRwowchKHj9NVqUm0RGwKa/2gbb+m
 Vk1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWekVUTisH/wBkY0g/5L3DBcLFuMBGQLfkcRmJcrfY6pU2eRdHV+caJpPtGB7qu6kRsGxdsQEj0kcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbRtchsG9UQ9HsV4cCJ99Jg3IODFb6AJzatHOb5Oh/NjqiNODS
 lEZOJqRihX5uNCyqvcO1tNkX+E5la40WJNj4M+14MVbhbp9sfPfycPglb+/V9xATqAJfAG34Jjc
 TijZpNEBPIBamBByImvyqFsf9U8vN5PNxdyYMEIFxUB2TPMCcSQr8EOaI7Fcxgwc76H2U1SM=
X-Gm-Gg: AY/fxX7wFcbohrQk2FEcnxUM/3jSGILrqr3yLerAmJ78cDpuztTSpRzkBMBuQq2z72i
 6H6qXjshoaYVGEViNMhA4TgxC0le0SvYOg8GwZ8u2QHs0uUzwY9DBFWZH4OcBOzNxuNmE/aDgNM
 Vb+2XlPR6UEpaAXGqKeVj+gyt/Smg2+ISQPGmyH9gxkM+otwBS3TN42KYkBq3eBbvHW2u2lNJtr
 o4lJ7VXhG0NMjm261vA39lYxrXZnZHM9o1dFwqe1Jyk4WMFHGBhqwkwqQdx1QKED0wt6XSJY476
 85IsZJFFhOS8pbOt8mcOb0STixRFohD0G4K5ANSjNmADE4Gg+VFXjABF1tamm8VK0/KeHi/1cz5
 HQwTI9og5A+XPe0+B+kivY9LaBVwYxaCHnyH4ck2/TeNhSooWHCnsMD0S5cWzVLBsziGSM+QJ3E
 ri7o9sjtc2yAIfSP/DT4xMUis=
X-Received: by 2002:a05:622a:130e:b0:4ee:26bd:13fa with SMTP id
 d75a77b69052e-4f4abdd147bmr258958871cf.80.1766568474713; 
 Wed, 24 Dec 2025 01:27:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv8MKmpaRPfb+4/iM2hRiwAOTJVkTLovJm5R61nJTI1nkvDcvDs063ITmDJne8s4O6OtuTHg==
X-Received: by 2002:a05:622a:130e:b0:4ee:26bd:13fa with SMTP id
 d75a77b69052e-4f4abdd147bmr258958611cf.80.1766568474138; 
 Wed, 24 Dec 2025 01:27:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 01:27:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Date: Wed, 24 Dec 2025 11:27:46 +0200
Message-ID: <176656845704.3796981.11060457763537143127.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l-ToOZHfotGWW1nCtp8rRYTJMDteRaaV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfXxwZscP2paw4b
 75SEYj5W9LRQsu1odzNIr0nRwH2R9uWPvdv45p5W1c9C+y+ulj4BecQAcmR1sI7aflbrUdU38D/
 xdM/O99mCAR+ggkYLISE75zx6JiKKSCzIWUtBUCauTsnZsKAoKdosyMjPEGbG89L6/k2ROU2PhR
 ZmLKFoj5Q1XlhRmLc+KjfZ1l+qS5mEZ4XOQrdN+ConTgVvPVX/pU7iIRd1SpeLP/BRwnySP+rxv
 nw8Tu8QIiRft5/z168qA4wzoGVFMEpaLkXwLufYAFcgdp/2tD03w9R+MnCDycsq00LEKn1RNLqS
 3aWYz6xTPDiVT1xGT5h3eE/9Hsyw6nj29OvroR7uqNRIT9dvHZcZylExIcpTkP3Lg5rx9ZCJl63
 +/Qcm36AFQwgK51VN6VPE2EAGQmcsUSyLz3eNj++4SHhByEe0Jzjewia1EswNTByQCQD3doQnLK
 N5rB8Xhfakug71byDPg==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bb21b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=TLISOKiRIOAQD9zG33kA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: l-ToOZHfotGWW1nCtp8rRYTJMDteRaaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240080
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

On Fri, 21 Nov 2025 14:02:08 +0800, Teguh Sobirin wrote:
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued
> if MDP TOP implements the setup_vsync_source() callback. However on
> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
> driver to setup TE vsync selection on all new DPU devices.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Set vsync source irrespective of mdp top support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0a7836e1db9c

Best regards,
-- 
With best wishes
Dmitry



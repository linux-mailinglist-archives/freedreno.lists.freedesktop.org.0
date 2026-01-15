Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA62D289F1
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 22:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A731410E7D3;
	Thu, 15 Jan 2026 21:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFICF+ga";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASofn81A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BA810E229
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYG853113504
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=; b=lFICF+gaABVgQTny
 N/CiKxWb1HRqPSpBiUY9iRo2lmE6IzZibGEYqfLQNY+mAFZseKhMfediFFwC6x/U
 4ZS5tjZe1iIm0fIkb4VkSczBGG0hNvtOvEKBEgzRsQu1dQVKH7MHhRxMIFBH7Omj
 xBDqgDDnfiChreRxc8NZjeC1HeZA9KtpRaBnZZOVfiZe+xDUCo2kTd+z2WYKnAfG
 fUF6ntjUWGnCHOyuyqO0RANhClTnoNr75JIxSLphHj1a26mm40v1mD+SDkteSMxQ
 7nvyFlwPbe64LQPX5qjG79mtprbsYzIx5QNDM3EpBn9qm5c2cNZ6T9vqOImUKSoP
 Cybj1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq2pm11vr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b9fa6f808cso440082885a.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 13:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511162; x=1769115962;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=;
 b=ASofn81AoixE7y81dRsK/1rJ3Mq6ia7Peyxn0khpqnbU/vzW1MEsL2gAaDF149vXtB
 /dyHdA2velaMkJe45spNXNvV9969U2YLV2zUqY2GhE+4rgJ9xWn71E2B+YKF+q/H0IqI
 fPuE1+ewEtl6r8SHcaHy1fJMMdqpadutofa42tLt+YlZDsaMUhBsmJJbO1cfgfhA95rT
 AqjisKRmXOJUol+GVdUx/NK2kz/SUAslwZ5TNav3NRksH9dKqSw/fsty9FY9F0QPD7Nd
 s6BTW6SHjWfFovLHvxB/NR/u/WPwoLsXRA0yyfvqG80JYZG/wO6uSg00wO4EQ08oCikV
 Jnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511162; x=1769115962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=;
 b=rlZlI52tb0anesQ240XohSJwPMbMvlC9IONbZJXtlNquFrtKPwcS3jSfZakTNI+hVt
 Te7CoG8fsTvbe/iEW1auY4eu9NDipv6AFGFQu4CdjRt7LK1ko8LBB2EZaYZtpUjyKwAb
 6K/ev5cWlqfxdX52S7RdURlwUPEt4EI70QVQ7g2xMNwZ/d8LS3Tt7rB9PHUVbQ5NyJAx
 HGtZXun/+IXly6Kx5/3/fLorjVu7xt4ptCXX6bcEziknwyN6STdy0k93Fh9UN8gBAany
 nOTa7TeThFN+PjumcclhgXNNc45tiWbQkn5oMCGvFG3BVk6DinwDOpU1Kf7G1NaEBvMq
 I80w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYFaAG3aTdYYoowTnR1Vhb6jqtzYXQIeOLO7N5gjyKiEc6HF162aN1PHA9+RBrYn4SOS8iN+xVdAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsePYLHwqmsaM48XnXApxlHguMs9+TOwgF5lGEuJnKHkXlCF6e
 XT/FfFA4PmKSuXgcpEfEQo4G0ViSH35ImQCd4VDs/ZFNUdLrnaP9yXJ4yBqlHMi3nk2LZd0Tn7l
 E6TSxAAyiQg1+SqHUpaJR9CgC+QajUafA9VfxnjVzUWzoIN5EmZYweoi0T0zHJ+n4KCj5lU0=
X-Gm-Gg: AY/fxX67pkgYP8IJjxW7d5jr4bWUVy2wneTdW0CbW5gk7KrXb6X9oi443mqexywNXSj
 JxzJBPrLX7SgD3VstvUiSjkqeqr531u2H73ewiWMqojTeHKjiNPXcLb4HViXGvSrr9Yqgd23gS4
 QvXIRjcryNK8/VMKtoiB7iDQjkuER3X8zy8hxgMkpySRMmD8GNsAb/DKZtynib4prJrKsxOfe2U
 6vRkJDaQbfBT0bbiAWJl5s69WGwUKQFIttuJM3AWfJLca8DP0NbVbA5Bf7PVeUo7obIcacs9UoK
 CUKNJrqer8uy8oY0eK8Ixd2x8cV/KclQVdFl20j3k4aSt1IkDOEMXl8CwYikw0uuJLcvVCJXwQ7
 nCAOyr6IUcP8FVt6m2YcJEJTgZYt37Xy1S7kwkmM5v3PSQlFJqWebZIC9ckqlf+242C4q2NHyte
 19Z3+j4Z3Gmo6HOULRbKoEVWA=
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id
 af79cd13be357-8c6a678e79emr110001385a.55.1768511161651; 
 Thu, 15 Jan 2026 13:06:01 -0800 (PST)
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id
 af79cd13be357-8c6a678e79emr109997185a.55.1768511161128; 
 Thu, 15 Jan 2026 13:06:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: Re: [PATCH v2 0/3] Enable mdss1 Display Port for Qualcomm lemans-ride
 platform
Date: Thu, 15 Jan 2026 23:05:56 +0200
Message-ID: <176851111168.3933955.1978286766565229688.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _N5adwh7f4XHNhKMzc3E2Tf3_dr4RYZp
X-Authority-Analysis: v=2.4 cv=TNlIilla c=1 sm=1 tr=0 ts=696956ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=aXzuBbYBWOr-X92n1-oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: _N5adwh7f4XHNhKMzc3E2Tf3_dr4RYZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX+syJq+IRtF+E
 9n4M6X2BNZE4j4taBO7NE1JZJllI/D8U4UIJ1pc8jisq/o9FoRLHtSAFdY9Loak1Kp9eFXwM8h/
 Nnd1B8t7NyArZ0Mgme9N5DgyFKNPeU3aejCfCpYckzvPLXr3egAqSfPmc9fYJWLXIGwmws9cLdr
 MSKs/yh1hmfgac+RF7S/urfTBuKhkg1zMePio11K4OrKC35arkSyY7xempI4NM/3RMR+EwYg5jS
 GRWMnhn2kr+u0qUjkG9dHMtSi0WQeTQ8bb9CyVVlqhX2DW9LPcCFCb1AxXIKNm8tK5j90bIwNvT
 tqJd3ebmaYUmBE8fgL2tmKWFndcg4j1CT1oNd5CujH/pXL3rLfH82iq3T6v20hgAAX/qYbksF1t
 Ab6WgmWOk6fw79REHjckTRDWvPXT5aNda1kYRryu/we3PN6GOgr2MdPxlIehSQwWp+tIU6tL8Lx
 HwzMl6omks8v6/K3rUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Tue, 25 Nov 2025 16:26:19 +0530, Mani Chandana Ballary Kuntumalla wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
> lemans-ride platform.
> 

Applied to msm-next, thanks!

[1/3] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1338e8ae4084

Best regards,
-- 
With best wishes
Dmitry



Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C556B54967
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 12:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B0210E19B;
	Fri, 12 Sep 2025 10:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="baq9JZNn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6728F10E19B
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:20:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDUX018538
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2+yk/HK2uTnuVPRZXu78qeeV
 MxzPMF0ZBseadsxMnhI=; b=baq9JZNnbBmtFqW2UCkb8P6sbj8TO0pqY2b/7FaO
 ywtAcEEjCW0fP1NFmwJ2ZmyuM3qyL1s7Q5y1aW6oXXCven99Q9ZZBRVAqyRVkP8T
 tibnnQQDd95xH4Xsk0216wOSu2WzFbmu/25Eo9VM8WPN6bDJpYr8n6jNCi3hpOZu
 NT5IQ6UZn4hvzXoVJCDKzS0+etyoDyg2umSy5EBclcVvaq0iHHvB2EZwangsKRUf
 PHoQbZlk4F18xguE7gjsWM/w6x7HzwRRnQA01k6p1Ywzp2c1vbE3K5meUlQNsmDA
 PTjj9Zy9TGop9cvAn5o9VWYukgf7X7bcJU9cMIsb7vv4pg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ak564-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:20:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b49715fdfbso59641391cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 03:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757672431; x=1758277231;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+yk/HK2uTnuVPRZXu78qeeVMxzPMF0ZBseadsxMnhI=;
 b=ARSrKZsBLWeh6me3WXFV/MNNRSq9WVmnAtCLY7u1xhKtC3/uWKwJzBtUi5BmfYxBb1
 FjOgcwm+uVvvum0i2Oaya2OyuofzEIUF8E4dAWel7PeAuH98L/3D58gr8agPnjjAVESQ
 mc88XG/XHVPk72uI2ZAtX9Qe24vFTP7aTSsxnN/2LyCre+lCo37IBS8SyzqpyrPAjPEW
 Evt5SiUtR35DYUylMMdFxwYtaTtA1nZlX2G0YFMr20gCXK1SXMxmh39Obi3QGpJn7Rxn
 a0QYKH4l/Gd3ciFxfR3IEY7TcyAPae8hwSrOf2ESDd8mIxKP5CZeAmqz8tUJMYZ12Dg0
 LbWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjGa6x1lpkxlCWqUaj+4z28maHmI0MQbdx92EDoseo3so3hEYF7X6cTsgqlFosIjmCgfI/12VSNK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy7Rs8eeMwKJGYDEmTHAKCc85aF0tWGR8WefkH0p1bFJmEdTUJ
 3SoGCy0LGfNTz532cZKI+84QCRneYgPp6Cu7yIle569JENFwOV6OqbYUfzrNjPdQHNYZQq1cUvW
 LmdJ+zITacRlpzUw88WJt5ZluXBoQI7tvcKfwKaJMOyHgvHgw6uZqXxP3pkw7PXEGhGkgYAk=
X-Gm-Gg: ASbGnctQVeEcWvinKKvnv9Aa/CmiWPBRZZfv5xE0MTDpqkGLQYazjuoZh2l+q50zm26
 icu9Mpbb14SyseJz2MgIy2emwU/R8C9h/RFjz554LdPy9L8C3BvG/qNjVmmrkHQ2g+5nJ6mTpB3
 sI77uZ4EutDZWZbyxAhbQhAxhffyas0erghS77b7rfWJNi3wYRnfUKrWlAxtNs1WDzO50K8guAH
 oSlVKem9FRUPmasBXd5wndrMfs6A5vQm0k+p/jq8e8HgjeugZM0w3e2qRwEtNiiPjJ0l+DdHUbd
 KsO9hNuq0T9Jzw03NcBxcRfU77dHyFecykmqbMeHo2AA18lxKEQ554H0XmlKtu0CIvrLYN9nO82
 IZW7e8kAuwxNvbuxNwGdbQBDVIKus+bQs2z6b6lmUkKA4AGb9RDse
X-Received: by 2002:a05:622a:d1:b0:4b4:9169:455e with SMTP id
 d75a77b69052e-4b77d05e8cbmr30994891cf.34.1757672431557; 
 Fri, 12 Sep 2025 03:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+kKC6NUmFZEfIjk6emSV08toNNjqRGF3CD3khX2vxvSwWG/Bv/20qxW9fKMHmTyb8jBpykg==
X-Received: by 2002:a05:622a:d1:b0:4b4:9169:455e with SMTP id
 d75a77b69052e-4b77d05e8cbmr30994371cf.34.1757672430879; 
 Fri, 12 Sep 2025 03:20:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b5fadsm1073715e87.6.2025.09.12.03.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:20:30 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:20:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 09/13] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
Message-ID: <x6p3hgatsauguzxryubkh54mue5adldkem2dh74ugf6jf3ige3@cb3mmigu6sjy>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-9-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-9-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3f3f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lnF_te-ij5czt4pA2k8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vdgNrTDebMZQAdgZBXjolblqEtkGtXR9
X-Proofpoint-ORIG-GUID: vdgNrTDebMZQAdgZBXjolblqEtkGtXR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX7YZAx1wExxmb
 iuP3X6cKDjfzfQNjFxTgBPFKs/e0Dic/W+D/pjTWI6/Al3d3HSBjk/sXvf+5qg1/sufITPU6llx
 8Ei+4gk2NwH84Xzreer1CM9riOmmN7GJo6P3QSwTY2rO1fONdXIjdyzYn6fKmtLYiGC9lDMM+kC
 ZVblr/ln/Z3BpRniwNcERVlgEaZf8HYX0tvUkhSG8v0abjwVOd0hae13JzsknCaYtuZqvu0OwOm
 GyQGvTpxIEh5i12/DymI50JdOzPROfcxGLa9K3DtbY8OGr8Hb3JhipyTSC0n58XYSLTioTzxQPW
 FV6z4DHglCbFJjQkVjYqSlKddU9chVArXOmAvSeL5f9PigAXc1SUKg3zbsh5lxspTaBdDL+DLxm
 3p5lqUrz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
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

On Thu, Sep 11, 2025 at 10:55:06PM +0800, Xiangxu Yin wrote:
> Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
> Move USB PHY-only register configuration from com_init to
> qmp_usbc_usb_power_on.

Two sets of changes. Two commits.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 47 ++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 18 deletions(-)
> 

-- 
With best wishes
Dmitry

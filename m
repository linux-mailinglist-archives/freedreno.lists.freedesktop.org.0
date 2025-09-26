Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB1ABA3F62
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 15:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F6910EA69;
	Fri, 26 Sep 2025 13:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hg2wO8C+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32210EA69
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vpDO016258
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Nj2RnivyVd0n/WCOVEL7yqPG
 a2Dwqhx2efpqU1IBZH0=; b=hg2wO8C+R0urRtBfZxtj2aG7BOq4ov0hngmLSsaO
 X5KuzdguO8iTvI1k6mXqGMiRPYJhwB94qyXgwQWNc541Kz9d66RpEXEz0bjCYVXT
 0GO4tHcML2p8xnAtjveHkOLeCRCbY/FFYtvoNPnggr3izeH0iDy8t2Iumh6RbF7Z
 f+jLphKHo8upBAAeyGYNhpDo565cesigtjO92ZjDLPYo6Ty0WTGD8Q+uePLX0jVh
 ZWCSJmRKCMrSHOMcC+cFW8ZleEqi7inzPWqClG4zSHQZmI0YUPF87j0ciz/qN+qH
 vyYAXw2tlmrzlvWE1AbAXFTf1CEqoRPvQRhuba1yuwBANw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rk281-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7bb414430c2so64756506d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 06:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758894790; x=1759499590;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nj2RnivyVd0n/WCOVEL7yqPGa2Dwqhx2efpqU1IBZH0=;
 b=alwhW8I1M2/MbM7k2o5+a9Kn/9Ge15qcSS27Ie6t2ya+7Q9XQMXTh9BppN3tS+keFU
 uZ0C2//cRRla4jiBwEXizTHqyH1HI+zovNxKEu1BEYPWQYltW27V7KoW/lmSWzKQ0asH
 Vak9K3mCwC0RX1WpGZGXmUM8ggc8RVj4MoRkZOsD6nowYkp1LeVBC0eLu5mJJS9lWa3V
 ML+sxeUKtH3RBUbVAHgZk5yNwLK6mv5Xr7t5hbc5nvv4iputWhljlEfqS5WN1vP7R7Lp
 M4cGBpF6IJdevA4ybHzd0x8BOhNVvYA2W7AKgCjhRr6CgJigsTG3v/0cQB1ulczyH2V4
 e4gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3vkmZnvTzd5KvSnEe9dTQo1sSQheFjcBx2BLRnNtTEeZkX0Iaxmme6NyMjNfheS6BRo63vfi1KmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwusTnRj9nBTf7L2t8puikyGPFlvbGcuzdsTbUcVW3P9KnHoX5d
 KF3ff+gy97LMJBw/QWdpWLM6IZXI73ReiAKPI73mapWPqHWtYGVVLVS5mJNgKuqjO9/UhAz5xMr
 tFbbVw5FQfxzSZYF5ptLCgI3wCWhEzahVPx7HKbdyX1LrpHiL07Qnu4fjQ6ehp2e98IIkfrQ=
X-Gm-Gg: ASbGncujl5toSX0N/O7hVhYpfjuj3dVYXIYIhHecnJIVzuIporSCVfBJjUkOFU2mXMw
 wTUa9CvYOfptPFRt7ZQlqhStU5SzGf6Slkey7MDxT6qViaTFTPakvwKt8hmhARPW8iwXtgtbF59
 xWLs+HJ1gHXxOPLpYUnnQ1RDwuvrNbXDvQ22oBIzyH1MFrZ7N06K0GmTUKgJBOvENlPtr0tV54t
 MtIDemTAh6p/uzin1e/ATsOX5cBEpxqMnkAG3+UhIoBCaIdch5UD+n9Pt48RGlrLwgBrJcDoesM
 V5gbXE1wuUBo4AhqjnkkwU/0u0Co0LpdTPR20mA7M/brcxakvdYAKXHdf0atdbFe3212RCz6Drh
 2f84CROaTzbnE0+PO3MlTMnJf1Z5Wd10DAEKXhe/cf9ctD5up7LQ3
X-Received: by 2002:a05:622a:1389:b0:4b7:a1b6:cf29 with SMTP id
 d75a77b69052e-4dace86b1e7mr81075801cf.41.1758894789471; 
 Fri, 26 Sep 2025 06:53:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMoJDS8aWtbyVs7IfWYIbTpQ5DxMdjd7gKuy6V247TUGZ3bJClP3qwuMmbDr8kW0U3F2DuOg==
X-Received: by 2002:a05:622a:1389:b0:4b7:a1b6:cf29 with SMTP id
 d75a77b69052e-4dace86b1e7mr81075101cf.41.1758894788737; 
 Fri, 26 Sep 2025 06:53:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316ff55acsm1846590e87.129.2025.09.26.06.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 06:53:07 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:53:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <kxy6p3fj656utoubj37ujzycmmszebmwb4c4u7zkb7t46ddwuk@xwg3xht5elj4>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d69ac7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=jz6_z25kcqxLI5rURXQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: babUFAbyMDTfFD6i6_M_DIUYHf-ruWJ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXyQDkmYu9lf7l
 1+P2SP5tYNczPgBVk5TVnWLIAHyul18qtnOBwG0eN2KcFKno6JmcOyO0rikLGHtmjiannJZ8w32
 zrYNZ/yWHZOpzQWjPwgh9hm0/EFNJQ3tI2n7jHWhKHjgoKc1M+//xIpUc8QKIvbpeO78tD1f1kS
 okrnTd9yVhz6AfVsZ8K9XWgc7P2mX0mgk+zz2U8moX5St8d7vnHV6aKlVPC1h1bao0EQMoUjM6Y
 GZzveF6uSr+1vHMAqUCdk220JG6wMP8PFVx2bB3/4RE8pOwok36VZWC8/kERkptt0cNk4YfP1DC
 VpmI4G9NBltIq0zsAGc2BPYZuK2uSCO0aZ0PU3rE0TgCOYAv2jAxrPmeHRdXZSZLIhpHVbD8cl5
 WfXkU/NeOxGxPD5VikxhozMRk8wEZA==
X-Proofpoint-GUID: babUFAbyMDTfFD6i6_M_DIUYHf-ruWJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Fri, Sep 26, 2025 at 02:29:54PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> with their corresponding PHYs.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 245 +++++++++++++++++++++++++++
>  1 file changed, 245 insertions(+)
> 

Squash together with the series adding mdss1. There should be exactly
three patches: fix for DP, addition of mdss1 to the lemans.dtsi,
addition of mdss1 to lemans-ride.dtsi.

-- 
With best wishes
Dmitry

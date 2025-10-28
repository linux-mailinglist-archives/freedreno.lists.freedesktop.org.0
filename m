Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC1C16DC5
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 22:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEECA10E661;
	Tue, 28 Oct 2025 21:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3zMR63R";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlpIIpEy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EC910E20F
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:06:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlHrw2615915
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3LuDd6Mqkc5UQN+6Kj33eDjK
 A0G6b3Ct+WK02iCqVko=; b=U3zMR63Rc8+9bWu7MD990IAbZnQc1JmD0cYakHK3
 ElAuoxoNkhHenZM520RRB0hRAO+XuMPW+hty4VztogTFWdpp+3NWvTUAPao/3gQi
 Us87yalsSQ2t0GiioPBTs8QMiNm9MsUNi64FBKtSmZyFbABrZn8OS0Is2QHTP9xR
 /n0RRi25EfQNP1JoNN2qzMBz0gUtoPXgwK52tJ05ndOpF54VXzcC4k7fUcorKkpZ
 +6Rgu2EZ0wX2OL73JIUJLqC2DkplXTY0iNhiNqbX0wK3N6hdN/f+k89M1/w6CPYj
 yrQ7eCziIoSOu9QVufu3/pZ1llklvO6qqgOTwZHUAcR9wQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0g5s0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:06:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e88c912928so182985201cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761685577; x=1762290377;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3LuDd6Mqkc5UQN+6Kj33eDjKA0G6b3Ct+WK02iCqVko=;
 b=hlpIIpEyR2w8b4szQ+46/3YXKgdZpxiEEYhV1lBcm4M82iuL8/mRiSZKeQQpyQbLEi
 WVL5rk42SyhbIELhuGNB3QprwycI3m3lv5MQQngt9CXyzuwZZy86Z4eiwpkC2Aub8gTE
 3EeL/9eL7vvfcnRrVsARqnBIvB3Eoi+4rayVKa2dCawPevpsSb4MeLk18dIFxPnhg1yY
 EBwQbIOBXl89T8lHNNPoL1AtIVOVKiG9MwM9N9wJ6cfJEH5TaEcu71POgi2S3LYehRqC
 C3LPkszSZtBekds6DAfL1kY6Wy4/wum0EhlXZp+DmfBVospvbYXTZA957cz8r4cVm7iP
 Lllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761685577; x=1762290377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3LuDd6Mqkc5UQN+6Kj33eDjKA0G6b3Ct+WK02iCqVko=;
 b=ed+42tZfLAuKHdQYNy+RajCeHjtSvv+MNXXquYCg1Ng/Xmor7HedDLrEGfcM+LJURc
 tUkYwwoKr0X4KjaizR0UCQCGUXcrpEHXbgGjG/0AbxTlwYZCsAhqa8iGWS6hg50yZFtM
 6yKFjCD6oNwsT5EUtHLK3QMplEFo9OR1tolck+0XWW7xg1yEOqW/HTkcxHkg1ObuZRsL
 7AIZ1QJC94LSGu8bk22RSyeNXnWq/JalgfRgKmsC/FL2oI3YmkAuI9mQIOZrQBqt6AO1
 eGPIbFtUXdCjSH5j3s62Y4XHFs/ibndvDOWjj9ybLz0fg1r/Ae2IvjOjFm1CSRAm6/um
 v36A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLT5ESa0rGj4MJH1Pyw8ATfY4l+NI764/lrR0HGvEiBm/1j4+P7sYr5rtmWLJb+FWZ5P26vlioLOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHtORxnqR/Sarjw3C1IZFlZ+WTPOlov20wkx2E2HwNxWEmNAG9
 UQ4iDWs4HI7Hd3+T/99bMAPRTiErxr03kYVMw+GsnmpJSBhkrE7Ra7cKTfzwI977oR6tPHmnMCL
 BOI2fkY6r9XfQxIopWvYWB0v7gjjAzv2Y2gVwUptnvGARG8LTaYVMH+PM6bRCXidTkGCVj6M=
X-Gm-Gg: ASbGncudhNESzQcEW622IcNyCCbMrGiL/vJVSJoQcI10pM63/sV9ci0+NBneyQMOx4l
 sbAizaMEsf9PRZh1+i8DlwDk4i8uNYlIRt0lrfM1eJREcqdm6Ras3aYCa6FKxw9lOTt3m8fsewu
 vyns4Qfna9YrKZnhWF7dV2IAOBt5rgsmpJEeysXdueYhKpiYxdn3notm0sVxdeleyF67Qn21/Og
 oOAzuWcf4j5UtCLe/8I9kiLzNjs1c/upV5sgXCb/rXMipXyqD7wovgTcT84j39W4ghts3GiY4+K
 0shUJRzoksFruFUewiEVQ64lY6QDVGk3w190DS7ce9nE+WVdm+AVJC/w5iIa0U+xUuaWWmv7jVX
 H3QhvjuuFWG16ACoMtjsnpQ9VRS5hn8wdjc3xW7KLbW5Kal7bKho+iX3Mg5KGfkUk8ptdyxme3y
 5gGyvQMD5TXfd1
X-Received: by 2002:a05:622a:2b4f:b0:4eb:a216:c070 with SMTP id
 d75a77b69052e-4ed15cc0fd8mr9754251cf.84.1761685576503; 
 Tue, 28 Oct 2025 14:06:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsAXdNpraFNqns3dJFErOHHCkGYA7vRGOdqLB7Vapn2gKMaCa6HiAkrwDzj46FFPulHQDr+A==
X-Received: by 2002:a05:622a:2b4f:b0:4eb:a216:c070 with SMTP id
 d75a77b69052e-4ed15cc0fd8mr9753721cf.84.1761685575889; 
 Tue, 28 Oct 2025 14:06:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee09d2e5sm28860611fa.17.2025.10.28.14.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:06:15 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:06:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <k5aszduqmczeuxpwzuq7wvkotvnqdnkhn4kdnmc6mjvzyxw6r6@kfa3cnb5qwnc>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
 <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
 <ump2gq7hta5dzul7bwjmb45dtrxezkbticdwis7opl2drmnuyz@wwlanncd6xlb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ump2gq7hta5dzul7bwjmb45dtrxezkbticdwis7opl2drmnuyz@wwlanncd6xlb>
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=69013049 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=JArj1d4ql11fNzbR7T4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jobyYFATgf_uoLuFuX7z8mMjaB8dcj9V
X-Proofpoint-ORIG-GUID: jobyYFATgf_uoLuFuX7z8mMjaB8dcj9V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3NyBTYWx0ZWRfX/V9pRifCo3qj
 QMAwzeDlp7hWef7Bej9uWtWqZIG/0ahkgAYSjl46HExVJ+/5YYafN9nT9I64X7PJvgSU1rZJvVc
 uMPwIX16QeOzoxIE2zwts9Nh0UhMOeCe4134avnjr5WMTSeUuPcqXLwH2WoD/awTagDEdy1oHmF
 P3rnK8Kqtbju0I+18UWz59otP9NdV+tiHw0H2qa3q5MR7mrt0ElpZttsp6CChDrBFOrCWKp/2x3
 TGnIY8XunPwBW+NhkxWZ1CvwMC3EafgOil68ZiIIqElzl9yzEx0f6vf6RhUw0oxumvk+qMxW8Vx
 Ngyscmt19BE7jIRR/KWXRr1tJnHDfB+cnuye6NXSn6AblBpIfTX6KiG9zPEQfuTbcrDUK558DW6
 +i1Fkh85wVU1yZ/n16SflDI/tzpP0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280177
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

On Mon, Oct 27, 2025 at 12:17:13PM -0500, Bjorn Andersson wrote:
> On Mon, Oct 27, 2025 at 02:29:01PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> > > Describe the Universal Bandwidth Compression (UBWC) configuration
> > > for the new Glymur platform.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > 
> > Bjorn, do you indent to pick up this patch on your own or would you ack
> > merging it through the drm/msm tree?
> > 
> 
> As there's no dependencies between the trees, I can pick these through
> the qcom tree now.

Thanks, SGTM.

-- 
With best wishes
Dmitry

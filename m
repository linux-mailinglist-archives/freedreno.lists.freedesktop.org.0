Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0F0A64C20
	for <lists+freedreno@lfdr.de>; Mon, 17 Mar 2025 12:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC0B10E3E7;
	Mon, 17 Mar 2025 11:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYHxUqMP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA71310E3E7
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 11:17:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA55su031964
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 11:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=h74ZuGvGt7Gc4RGJOB1qbK9R
 Ms5B7HunMvfAcbl6nvI=; b=HYHxUqMPrJ3obXGUkn3BioKk6j6uxHLRu7NOjZ6Q
 na2xwlx1XjT+6HHgGhYHgxUu0HyEUuyTIw4tkbu7bVGW4moFV4UW93i1sFXRpgW0
 C+b+xTlN219AHLkDzh4tcROiG7Dng8YcRpKoU8os1A4BeGsWI85bY1d5QTWYvVR9
 mVK9+SHC0mXBWnWtE2KjB5SnL91X+q02dIyuEGOJQ63A/viXrJNynF0ffqW3ekMA
 4uV+/ttvfdmdKGMgKZBIhm7ClX968bawO6/xmsRiK+cZg95wEZIsntqvexcreKnc
 Cfr7Faml7mCCPwX/cYaHRobY+9D4Qdg8QLj01sKWlQcWYg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1tx4f2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 11:17:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8f6443ed5so94372486d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 04:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742210248; x=1742815048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h74ZuGvGt7Gc4RGJOB1qbK9RMs5B7HunMvfAcbl6nvI=;
 b=C9Z8zb8IGZHB+7KvHX4cf3HJzs1SCGNA5RZAgWRmY6vcWlXUlnuVMtpAgqDPUC3QBu
 6ZkZZ1MQemHVmB4RRiKswTzfj+1e2g7A1vn+06WQRCiU9lnfpB3jXsx9qTfbNd+7GGSW
 oIpqG5j7y1ESHrWnGtbfmSJ2FDbzlsHoRXvxCg4mIpga/fFzpY2vLvLj5qQ9B+7jg03E
 1YfpcVAC295p1TXho8sAPtlZRrLwNft3VJlFGbTPaBQ+v9kbegQrAJXFmYLiicy+/RFW
 VJeEbDAv0l9jpKFOWj4fWdmauac+InfllAmI1JeBGzT57hfLVsKoTzu2zGfgcm1sCS12
 YGcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyE0Frn0QWYIgu5cI/j5xN8ryIU7TCndwwW7bkjipEMdDFbODqnPODVeyOlG+ODCjAlL899b9YNZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNhlC6Nfs/rCh/CmU2Fj8ARheQOnEXNTFIp+uh4JK7B7bUjbqk
 HGw8pq0ambWEArsrvG8a8rOP1K6lOvQoMD2QCvUw9kC+EU/gXAOZMFgZtnaAToJMPHnLrB2CmPq
 W5kB8TQiyg6CtoyGLtFWNDZGJvP8asxofyECkYuzlYSbCgJwOGc2lQb/t/8kXE1uEeS8=
X-Gm-Gg: ASbGncus+mH7ghdke0HwaXLfdtsEgbNQBo7TPGn+li9T31KrOLF4UUQTGwM6e/g98Eu
 ORWe6PYtzON8g2YMPIs/CJwiKP6LUzLUb/vamcPeWDGy2CWJ0p6lEw109nQWJE1P9ica0r1/rEQ
 hrDjCLDtzuzSeoGpCPfTawlCd7GGuC0XBgCrKfaywShDHsCmPzPipwpLP4rDnqZkz50e+yadDH7
 4mmf70iK+KLh86tYmNBTqkHDS5FnHf386QgRYeQqKLpq/SXhszwa7h7JNUC2QYE+p8hq3XRmGk3
 9Ig+Ko3PzXD3lFKhN1Ibk/4AbwI5NHkeINLpLzbYcZP11hgIajK6Hur4J9/3txnXIfnar8UT6Ck
 9ZXU=
X-Received: by 2002:a05:6214:5784:b0:6e4:4adb:8c29 with SMTP id
 6a1803df08f44-6eaddf4d222mr233455296d6.12.1742210248630; 
 Mon, 17 Mar 2025 04:17:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1cyDl4xkioe3y+ghWS263/60KKZ8OYW8NPmR6GC2f7A41gOXYwaVyUw5mFVJ9O7ml2j/IHQ==
X-Received: by 2002:a05:6214:5784:b0:6e4:4adb:8c29 with SMTP id
 6a1803df08f44-6eaddf4d222mr233454916d6.12.1742210248276; 
 Mon, 17 Mar 2025 04:17:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864e24sm1302546e87.107.2025.03.17.04.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 04:17:26 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:17:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
Message-ID: <2wxcuacri3ts24hyuqpvw75cubkhcup2mftrsu7yykrrodulix@fmuzn3unykux>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
 <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
 <otidtln4pjb47azr7zhllxkqmwocdnbdiay6xcg6psphz3436i@fn5hxgaflgv6>
 <20250317-dancing-loyal-malkoha-ad5a36@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-dancing-loyal-malkoha-ad5a36@houat>
X-Authority-Analysis: v=2.4 cv=W/I4VQWk c=1 sm=1 tr=0 ts=67d804dc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=dGy_cPlXK_KhQYNS9IIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: twUkUaNdWn3oh_DDQKEGpTXCJIMyU41T
X-Proofpoint-ORIG-GUID: twUkUaNdWn3oh_DDQKEGpTXCJIMyU41T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=978 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170083
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

On Mon, Mar 17, 2025 at 10:45:16AM +0100, Maxime Ripard wrote:
> On Fri, Mar 14, 2025 at 08:55:05PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Mar 14, 2025 at 05:54:14PM +0000, Maxime Ripard wrote:
> > > On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> > > > It is common for the DisplayPort bridges to implement audio support. In
> > > > preparation to providing a generic framework for DP audio, add
> > > > corresponding interface to struct drm_bridge. As suggested by Maxime
> > > > for now this is mostly c&p of the corresponding HDMI audio API.
> > > > 
> > > > 
> > > > [ ... ]
> > > 
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > 
> > You've sent two r-b's for patch 2. Is there a chance that one of those
> > was for patch 3?
> 
> Did I? Sorry, it was indeed meant for patch 3

Yes, at least mutt and lore show both under patch 2. If/when you have
time, could you please fix that so that the r-b is recorded for future
generations?

-- 
With best wishes
Dmitry

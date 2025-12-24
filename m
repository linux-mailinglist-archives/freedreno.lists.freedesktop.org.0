Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C9BCDBCB4
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 10:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB92210E9A0;
	Wed, 24 Dec 2025 09:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1fEX1sF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yy8O69pZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116A910E9A7
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO8VswG721275
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uw59O712MjbFpHjUkMja6O6UHXeOcWDA+gCf8efOSlM=; b=B1fEX1sFeM1nBkXj
 FYmoO2+CnU/wIvf4Fgc0eUZVnTgcVxPGSZgB2Yyu85mC/SOJlMVHMkeDmloqzUpd
 hMRTi1d91LRh7xV+Xgu6w7QC9/dQwrJxW+D3H8DHk5JgW/gur3b9AVRTu8SYo+So
 cDv7VSlBK64As09G8HiES1C6KlKi8usy4MTDtA+G3jA+XRkemNqdoMvN6IOU252b
 b4eHLR3TBy9Mljwwyvzki/kTFdYj6yLa2p2G7zSgVTkvYmafYVPzp1YPYkqVrV2b
 sSYnBF2xxvOVXojaskvuGiulDs1IdTvECDPMcRKGEGkHD16t+keaggsy+D5anStF
 2/71WQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt9t06-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed782d4c7dso100206051cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766568476; x=1767173276;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uw59O712MjbFpHjUkMja6O6UHXeOcWDA+gCf8efOSlM=;
 b=Yy8O69pZpEhgEAYcYhSM8jDX5C3MQfx6cFgkxROjh2C87kOO9PtxWrknThkqv+6hX8
 JyLT0Kvsx2JtWTG1a3xwZUkaUpLWallCkNHSHRitAmTHcVHIGY3cWhJG73RJ9bTbb/H5
 h6eIbBtxw6tHz+64cOEYDPchZcbeEJsdc8gVfyAe7mftniue0QM/ZXKDElsr4CDRMSRv
 h5qzqAJaxSB7hz7e+olSK8bEqaoYeexu2stlo0uaC0n5zjK5+RtIfo8DkM4sp87VGE41
 +gUxpnHj/pUP/grDS+prcooZjAaLqoGI/KpWBTOIa3ER9sx8WjLYQPELPA9Acs3VlVQ0
 PJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766568476; x=1767173276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uw59O712MjbFpHjUkMja6O6UHXeOcWDA+gCf8efOSlM=;
 b=k6tldIEAHH8c/Gv58nzzzeJovHothGFy0QxqzXKv4hplIAhAAGQsa74vPBUcLadqba
 jzbWgKYi2IEAjFzNUbWFy/8SZdOjOdHgSq0AfWjrtZff7Cp51vhVZtM+qI+hpfD62pX0
 ISHmUcl/9hVchhZ+Z+b5NRU3/SWURUT2CaZLtH/7ouuZrFXeom4ueyznLosh1UqEY3M/
 nVcsJMTAvVp3ypd5DlK3d26YInCtBEz/Ul68dXSAHBAO+kiDs88FtaozhOx1GvNzP/HB
 4PZX4Adm0ZAAYZV2Pn/H4jD95pEBP6ZemPfJ+ffWFCHSwYcdMV9xlz5MTcFJ8eCjZJ1g
 dwyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzgSh9HOGA+2g8/i4QEXvBb38BXoGOLmqLAJcMUFtolDMXdH8r7RRgwK/RKKMG+LvtExcKpLFs5DI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5+MYbrTV9K3dR0hTY3GuVTdZ4wx+x/6H/r7yMv8sdLUhF0hte
 qIm94GoWrHFdI5SEoKVdLlOW7VG8iWT8IwBd6RlwydOlDrjGUyMCS7GKLZ53gbPoIR6W2QqefUX
 86GP/ovKTnjQXC6/8A8uVEmLEEYM9bMEp5NtoXIo3oeyzmD+vguhSu8CrZvCAHLFg8gxcS5w=
X-Gm-Gg: AY/fxX5lWrZGrDNxM8xXrOe39Q8cvFwxK3JIBhGUgEt/PBcJOfBDpmWqD0e6QLUx74D
 pxmP4wq4qRvzX2u+b46SBeLDFreQp+djLQfKsYxj+QN9grtcQ3R4Mrk/91NsgZ1piIDj2S5jUp4
 bRpyoDNM7L2Geu3rpzVF/4O1J3BlvQhr1oa5EfseBHbYR4bImbZraHtUcTvKOMtCLyfPIpTUhr/
 9afLoc75Rd9iNTsowX8w8tDooIzlKziY3MqhkuPFjF+r2W8HIqPl2nJDWmwzEsCpTLNoB0GddhG
 lx26r2+b0lCZEobLxjyeNS0Z7V0cunEjXZcqba36zNghSIgwmMJGWabQFSLp6mWXD9/FuQASLkT
 meWHaNSxdeYAXkY3ArlcwYTFev9AlccjokPQaIKMO219Tq0rZm+bK4WvpWJJWCpAvhNKZoevcXB
 PS5KALr6Kn78vVlvxYCkq7m1g=
X-Received: by 2002:a05:622a:4013:b0:4e8:aa15:c96d with SMTP id
 d75a77b69052e-4f4abdb59d6mr260677511cf.55.1766568475671; 
 Wed, 24 Dec 2025 01:27:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPmb4FBu/+NZZjSLP6QEyoiN3Sxslg5qAtxT5t/ZMlY4bCsQu8Zu0+SBGsXE1HnUerjBYM2g==
X-Received: by 2002:a05:622a:4013:b0:4e8:aa15:c96d with SMTP id
 d75a77b69052e-4f4abdb59d6mr260677211cf.55.1766568475245; 
 Wed, 24 Dec 2025 01:27:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 01:27:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, veygax <veyga@veygax.dev>
Cc: abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Date: Wed, 24 Dec 2025 11:27:47 +0200
Message-ID: <176656845704.3796981.11008925293580480750.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251130012834.142585-2-veyga@veygax.dev>
References: <20251130012834.142585-2-veyga@veygax.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bb21c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=Sr6y7Swg9AFsQnQ4lA8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 9PmJoO3coI9zTumA-L6JjZPMr6_6s1y7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX861WFRBu6DKT
 sYPyxQzvUhc9MT5FvLZ0CTehm5EMD7psU47+NTySj7y2RG7HZB57ZJ9W79dvo4BvtaRYaapgkxg
 0yinGZUk3WLtG2PpBxsTVH/jCt2oB679K5al52U1SAjpiXi5ToOeLPjAYHtrzwjPAJC4DgI1Akx
 rxvBAz79J4+FOdXTmcDJERl0xgL3ZOLSnkkUNY1Y82GYUnLDuh1UOoapRPi3HP22vAhaaUjzDhA
 /g+WHR1TzH118T7nMDCZm5ipVbQ7i0BgKHb3Ol0bHmdlce4JcjFUPW7LAzflAOFf9s7CBh6e/D0
 pFWTEQ6KwL/eOa9Cp4CKdwIxeMaZPFSEVqXZuUz9S2v8lJhcCV3pkReMQEk+j/2T7iyG4xxJrZ4
 ebgJoclOYAYOfxw/MKFnc+bI3fm8kDn4vgdH6Z3Bbv5tpn/vMkzHxQnKe/0lVimwZz0JPfWMBD5
 KwBzA5oqJPrUkMuXqCg==
X-Proofpoint-ORIG-GUID: 9PmJoO3coI9zTumA-L6JjZPMr6_6s1y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
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

On Sun, 30 Nov 2025 01:28:54 +0000, veygax wrote:
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
      https://gitlab.freedesktop.org/lumag/msm/-/commit/093cbd754382

Best regards,
-- 
With best wishes
Dmitry



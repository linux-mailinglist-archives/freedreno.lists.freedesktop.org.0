Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF950C5D8F2
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D28510EA89;
	Fri, 14 Nov 2025 14:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fkb/SFPp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KooJMzi+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2407C10EA89
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8eIma1581022
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=; b=Fkb/SFPpPZe/enQM
 +UGfsfN+YDNnEEJVt/Rlbhe2LTpGowAMyvAb6tal4bo9EH71bFnc3kJK544mQOn5
 gBUcSwooifVSiJGc0aJ1h0kS230Px6rpQM6YFrGPMJRYjU5oT8QMVpmcRbccGIGZ
 UdFIDLE51fM7KBeFURGvm89W1937fgT5kEEMX/9HW0NBMdehTQFTDt6wSQmIqTzG
 HmmCnxzI4Gzebso8HINCkSpju0iVajLm/dcDbjBJEfk55OXFbelD5bax1ZrjpVKU
 wEtXRjxbZGsXk3ZQBvPM3747vcGOhwSEOQ5lHolgUre7Jf4i3jxFTXZRxj+jJtfP
 ZA7C0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ftewu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4edb3eeae67so68547441cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130396; x=1763735196;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=;
 b=KooJMzi+Dxk+CTGDC3Kn8X6q1RiiivhWhoRWapqSrOtCVq+1Inv8ssS8/qosBpirOm
 G1tcGJLmVbxkvarfeeULKoqRTNDcr+b3GgsRB9QyC37syriWhvfUxXAGA/jYi2YaXQJP
 QXD5wpMTlSlCJisWIE9t1euC762ghopjkATrZroo5o+LgvPvEPSL8TcUCOgC30L5vqJS
 wJ6wh688uY5Rr1+Df+MhZYTpxM441j6wuOBVUMJSYmY/O7j7GC4fc6gQX4gGLDbXf3nw
 ZC6JgP6610I+bHRIs+oieeKfOG/4mr4iARKir63wpAGPgUQ2lguNi/kBEC2YKw8TuUak
 fAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130396; x=1763735196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=;
 b=roKMwuvuwvZRLJRpO2PiUvqk6vOZbftkrKb6q09ppC2DL7UcTKxPXH+kWnPmc2ZrZS
 9ADUY07Awe8jTO8XaHJKWzOXx1YQv/nvJgzDbGlvHdcyAbapCoMgRBj+knnON+heiJiO
 +93k84g1Qwg/ZwW/GmmyxEnDMEOCnD+sJePir6W6HpZfPlroJFgCrCQ12zzV3gl23cMD
 Ak55SuzxzrP8iVc5JXWrt0I4rqXJGRWIp1wFdohT/G1DtPAQ9TYOtGlzv46Vr26Ycjad
 bkqIhHQR0M1E97Rm/8hIeEugT0IEz5EfMpJpYd9eH0svmyeaaR11slDvk4104ZHrFoXl
 2f4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdBolcjX5KyXfOAP8BlaCyYkbKtvi5jM99g3mlh821JunNB+lUjo7zoFL502RhdqVyFApBMu/Cdqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhnZQGIjUvEKa/GZoa+vzNG3pcyq7zHrtTf0eaYdGYyWaLcDmo
 +Q59OHDb/H2NuFu8WmoGXjumnOPLnDjHK5/UKoTtUoklfdxd6CAqOhzix2b0g9Pr1FektNfDW/l
 jvWX7WwB1ljG74wNjrqB+5hoz3/OtRXutVuo4bRaLWpm2veNhYnliN6xTZ1AHVcPq6NdjKOI=
X-Gm-Gg: ASbGncsCzyH4tbcJt15QRqq5+B46rLAp0xI+1xf7y2rkE1h/1mAtb/O07rzADso2Kqc
 12sVQGLrrQTECFqWRtF5aUwy3jkC5/CIORlIAtHHGfrb/kjd7eG/zVSX4Exc5P48YX6UKnLS06j
 aQdGYuAbaBMV1FYJxJce4FwAXH3S9NJIVll/5UIkRPRjMS8FJl1DJMxup9L6q6lXziJvaThn2TX
 oeRRADaywisHGrqKvxDkYOG9n18KJq2AJBRDrAZ2vMlEJMiXNfgldbCJXuiW58PWyFikKeYM4HD
 d7NnbkrscusovYR6/Qd2tJdwHYidFyQsFuh5S5L+4B/kWE3a3A/h1GKL0Fmry8KhpsAtnhDgK/a
 99LaBOeAt1b9JlrvlgohcnUoVH9XHAd56ZeWtU3UNSft8sc8w5fMzxlYh7d2o6jy0fWogClv2+n
 4XF59fJJEwGgyw
X-Received: by 2002:ac8:59c5:0:b0:4eb:9e22:794f with SMTP id
 d75a77b69052e-4edf2171bfemr44962661cf.82.1763130395508; 
 Fri, 14 Nov 2025 06:26:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4YqVYNVjL/1B7NeGIRe8IGvJOuyU+4Oeto661Y2vEKRPzlrXHYqZMVbHPWOIM+paqpNmJNg==
X-Received: by 2002:ac8:59c5:0:b0:4eb:9e22:794f with SMTP id
 d75a77b69052e-4edf2171bfemr44962121cf.82.1763130394913; 
 Fri, 14 Nov 2025 06:26:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Date: Fri, 14 Nov 2025 16:26:28 +0200
Message-ID: <176312947286.1737000.3509947007748162020.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69173c1c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=UqLjAnsgJHsByH5YNvQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: lMph9WFKphG9Oy9BONPH3JSExFO1iSxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX19nazBpaQ6NP
 ULKGhRq+qM+FXYz3iI5oGywhn89lvgmgMsoVg7cJMb1y33AXeRwrdVwAsLJvTgDqbkl89uVcQT+
 QHJAWACLcAUnwMAoaBNbkl+qPF6SSa1D75ZMVsnzNkCLxXyoKnSsVxQ+VCac3ARwo4Zdz02x67U
 2vsYS4vhplqAoVrZxoTltozxZreHxcn/Z1ve4TP5xC8hRfV3Haai8A/+UyOvnl/vnChYpw0tFv4
 m9xgbG8Pi5Zm1+5Bk32UXQSR6W7Nvp5TVm6hues5Bq/KyvGmhRLU4Jvy2bofM/ckfEvFhRFfAf0
 cSCN/ECcRk4/ZVZl47yPkbFR85gGxA8XuJgqzvU+GQcCy+qVbFSTcasDlAqTsUjXBUc/hKSlxdm
 eAxvybllvjVVS3MLhdA1mmEmFodf6g==
X-Proofpoint-ORIG-GUID: lMph9WFKphG9Oy9BONPH3JSExFO1iSxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Thu, 09 Oct 2025 22:09:32 +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: Remove dead-code in dpu_encoder_helper_reset_mixers()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/762dd3eb0c0f

Best regards,
-- 
With best wishes
Dmitry



Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC258D289DA
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 22:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAE510E7CA;
	Thu, 15 Jan 2026 21:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pihlr5hR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhHv+Z+a";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADEF10E7CA
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFY6Iq2174358
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i/SNuK0OyUKQkfb9yXj9vuwgdkG5/x1BB9qp3E/bVDE=; b=pihlr5hRNDMlH5Eo
 HDO4aQ9hlDtN7ejwdyrQ7/7aRLPYDdTqkDXA5N1fcEBNCfZr641KSZRgcJW+VLQJ
 ycPuC7fHqqSV1G6C5zN3krTtYrr7SzrhSSV5cb3yERut1d7FvaUsVquJW8jQY60W
 9XOA6lJKHnSz5N6GjnmzTXrRRJugsqRUEYjTbiF48X1HWlpasMBMLLx6I+asSv/S
 GG3siMQ58K8JMg0VJ5o+XDLwGitJZhVtk78IAb4z2Zv7lBVmlzOmB8WbxI2Ep6eQ
 qrZ6C4V+F9BZ6Z2lzCWAn3y4ky4YmOVSea++Cb144CWdjQzso7/RidLkJ/yUOrnX
 93XtWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh97mx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52d3be24cso181150185a.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511158; x=1769115958;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/SNuK0OyUKQkfb9yXj9vuwgdkG5/x1BB9qp3E/bVDE=;
 b=BhHv+Z+aH2S7lKvnJorM84G/UnQR92rUiMygLADyiVCMgNGPQW+V12Fxu1f1yL1z2/
 yIzYQ63BQfL81PfK2Ikt45S5UwmmIEY54TfqsTypBpJj1KdBC/a2eKuq/YTkrpUnkHAo
 JRV1HC8t7x9Q8gg6pVddAWGqwHa/BOl1BUUIeK0Kkp9YSkU9152oQmRJUqERmgkpAxds
 hqvrxSAhsASpntwMmErU6RCs3ZmyN0JI8bm1cDJWWCKUc0SRTGbT2Qb9BuKhTNYEdEHY
 oPDpLpFHE+d9VdRjeNr6qyNBDLyb2P2ySDRxAbj/oVEXyxNSZLDnPo51oipsFif+dL5h
 O7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511158; x=1769115958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i/SNuK0OyUKQkfb9yXj9vuwgdkG5/x1BB9qp3E/bVDE=;
 b=xLhgW8n60fuxsTmYx9Q8Mi/fVlSREdSmwcjzd6lKDFAHXeEd45yuugdbvzhsUW+FKl
 +P83xWemU+1+I4dgvkMRgbBgq1d5j5WQxHI6uYwRchUOzeci3sO1PK4aEeHxdeOyiTVT
 sV/rF1vvFmWUCiZMIUIRYnNlHHgBKKfCV103OzBtWQyvvErVYRSKGAorwaez08FnNDFR
 2AHjy9kyyfup3oCRvmC0ToSaKCwdyOK5lNXsV6fg0o9K9082ZQO29iWLL+4HvZEmkRnf
 wfuviiX0iwtUEkmzolWmVZG4jlXrPfxsugPv1ZQhH5ShS8aaOq7mkY5oiX413Ld3BHg+
 0Q7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWsIfeC/5yb2b4umowQ5/8G3YA7SKu2BAul7+eizmHXine9a0K3psdl2wtww68DGDp+i2pxUFCrZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVP8xRIaCiDwGR6COkxZAFMsgg12DAdNryMxm4TzJ2qMF/3YLl
 0e02dsnR+VcM9RGf4A8YzwrGC6NObdQPdqAPXtpJeBmk1PeORXwG+RrSSWa3siTXnUmBrnDLnag
 hijwmyvv1JhsHJCq9oxfuYUEoVFD8ANlOOaR9tE4ubLthd5VTC9HEKGfoDdNTA3e1d2HrQfA=
X-Gm-Gg: AY/fxX5XKELzsQO4mNQ+FVGX7osdfsdBShSnU4XAWzURLuc3gy7AEMvK40o5o4gQfVv
 wG0MAEO2BeIwjhEOrVQx+SiXIWyCws/M+/BhCd0q+6R4ck33ThlbfP+yrVEvmtuz+ftzhZagXI9
 cyIO+GBm4Z6flBGl+dzKmUIRWa1Bk7r9oI20f+dGbUPjqedPNFqeknR4Sb+AuI9YB7oJ0oKOG39
 NYc18ME50cqFVRToITvEQXpB3T0TwBR9zo8LbZjhIMEpr6Ws+j913JRjEcYPoQ2gomf427IUQ3s
 w7uyCL6G6mCssJgWQG5otjT5Cx5mMb/+pgyQrWMgwvv9mqvM94iWxKgYijkMgVhjkgzQnXzyreO
 k77LNDESyWLI0fEMq/LFTyWWzMelSdPWMqalM/2KtrXnTJKZlKjT9R2YUrslkKrSnLi/D8Achg/
 JTRG6D6EjmzS4UJEq7tDrGecY=
X-Received: by 2002:a05:620a:2a05:b0:8a2:7cda:f040 with SMTP id
 af79cd13be357-8c6a678a36amr148009985a.51.1768511157702; 
 Thu, 15 Jan 2026 13:05:57 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:8a2:7cda:f040 with SMTP id
 af79cd13be357-8c6a678a36amr147997485a.51.1768511156597; 
 Thu, 15 Jan 2026 13:05:56 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] drm/msm/dpu: fix vsync source programming on DPU
 >= 8.0
Date: Thu, 15 Jan 2026 23:05:53 +0200
Message-ID: <176851111169.3933955.9170507722560093643.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
References: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EdMckrImdEVDgWjTo29cF4vDB0Kv8IvJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX/xHUpH6OEVro
 db78sKf+bJAzbqp08CA+r9xg3S9C1QVQWwQQzm9JPVbBbLa8QF3REi2GCs446gwbrCo93XqxThG
 U8sAAnmtdGknO93UrZdGXE6hPGOaJf4BVXab3FC7LJhSYqk5VZAbsJ93gg+yehZanoae3uQ2Xp8
 LbACMAsu7HxbF+Il7DUULXRePJXEArE+KsGJmLriIyfC6Zck3bx4A9WicnFOem/5/a9Hv3474EZ
 YR3XQxoBjrxIapW+pYw71cVcq33A1Qy9D126FSdmFoGieIaYlGh/TStH4ojjY17KWt9sxTGURKN
 B5ETCmuauJyukI1ApbpbAOQuTS3UcCx2L8GWnNK26B5oSfGA+6eW3mIus7SwrNoHMBp62Goy3hJ
 EFlPD2Da8DuHEpvnyayj5pDXwmAOs4Tp3H4K+kUvdoMG74XOU4zHB5d2zjMLDF/UVzto57iqzWM
 w7LGR95XUNpY47XxVPw==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=696956b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=tuvf9S6D2CPeCQ265SEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: EdMckrImdEVDgWjTo29cF4vDB0Kv8IvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
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

On Tue, 30 Dec 2025 09:17:55 +0200, Dmitry Baryshkov wrote:
> Currently VSYNC SEL programming is performed only if there is a
> corresponding callback at the top block. However, DPU >= 8.0 don't have
> that callback, making the driver skip all vsync programming. Make the
> driver always check both TOP and INTF callbacks.
> 
> 

Applied to msm-next, thanks!

[1/2] drm/msm/dpu: Set vsync source irrespective of mdp top support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1ad9880f059c
[2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
      https://gitlab.freedesktop.org/lumag/msm/-/commit/794b0e68caba

Best regards,
-- 
With best wishes
Dmitry


